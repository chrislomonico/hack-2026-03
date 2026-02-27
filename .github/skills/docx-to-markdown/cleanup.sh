#!/usr/bin/env bash
# cleanup.sh — Clean pandoc conversion artifacts from markdown files
# Part of the docx-to-markdown skill (.github/skills/docx-to-markdown/)
#
# Usage:
#   cleanup.sh [--no-backup] <file-or-directory>
#
# If given a directory, processes all .md files in it (non-recursive).
# Creates .bak backups by default; use --no-backup to skip.
# Idempotent — safe to run multiple times on the same file.

set -euo pipefail

# --- Configuration -----------------------------------------------------------

NO_BACKUP=false
TARGET=""

# --- Argument parsing ---------------------------------------------------------

usage() {
  echo "Usage: $(basename "$0") [--no-backup] <file-or-directory>"
  echo ""
  echo "Clean pandoc conversion artifacts from markdown files."
  echo ""
  echo "Options:"
  echo "  --no-backup   Skip creating .bak backup files"
  echo "  -h, --help    Show this help message"
  exit "${1:-0}"
}

while [ $# -gt 0 ]; do
  case "$1" in
    --no-backup)
      NO_BACKUP=true
      shift
      ;;
    -h|--help)
      usage 0
      ;;
    -*)
      echo "Error: Unknown option '$1'" >&2
      usage 1
      ;;
    *)
      if [ -n "$TARGET" ]; then
        echo "Error: Only one file or directory argument is supported" >&2
        usage 1
      fi
      TARGET="$1"
      shift
      ;;
  esac
done

if [ -z "$TARGET" ]; then
  echo "Error: No file or directory specified" >&2
  usage 1
fi

# --- Collect files to process -------------------------------------------------

FILES=()

if [ -d "$TARGET" ]; then
  # Collect .md files in the directory (non-recursive)
  while IFS= read -r -d '' f; do
    FILES+=("$f")
  done < <(find "$TARGET" -maxdepth 1 -name '*.md' -type f -print0 | sort -z)

  if [ ${#FILES[@]} -eq 0 ]; then
    echo "No .md files found in $TARGET"
    exit 0
  fi
elif [ -f "$TARGET" ]; then
  FILES=("$TARGET")
else
  echo "Error: '$TARGET' is not a file or directory" >&2
  exit 1
fi

# --- Cleanup function ---------------------------------------------------------

cleanup_file() {
  local file="$1"
  local filename
  filename="$(basename "$file")"
  local changes=0
  local tmpfile

  tmpfile="$(mktemp)"
  # Ensure temp file is cleaned up on exit
  trap 'rm -f "$tmpfile"' RETURN

  # Create backup if requested
  if [ "$NO_BACKUP" = false ]; then
    cp "$file" "${file}.bak"
  fi

  # Read the file content
  cp "$file" "$tmpfile"

  # --- Pattern 1: Remove media/image links ---
  # Matches: ![](media/...){width="..." height="..."} and similar variations
  # Also matches bare ![](media/...) without attributes
  local count_before count_after
  count_before="$(wc -l < "$tmpfile")"
  sed -i '/^!\[.*\](media\/[^)]*).*/d' "$tmpfile"
  count_after="$(wc -l < "$tmpfile")"
  local p1_count=$((count_before - count_after))
  if [ "$p1_count" -gt 0 ]; then
    changes=$((changes + p1_count))
    echo "  [$filename] Removed $p1_count media/image link(s)"
  fi

  # --- Pattern 2: Orphaned bold markers ---
  # Merges lines where **\ appears alone, followed by the continuation on the next line
  # Before: **\          After: **SPEAKER NAME** 1:23:45
  #         SPEAKER NAME** 1:23:45
  count_before="$(grep -c '^\*\*\\$' "$tmpfile" 2>/dev/null || true)"
  if [ "$count_before" -gt 0 ]; then
    # Use sed to join **\ lines with the following line
    sed -i -e '/^\*\*\\$/{N;s/\*\*\\\n/\*\*/;}' "$tmpfile"
    changes=$((changes + count_before))
    echo "  [$filename] Merged $count_before orphaned bold marker(s)"
  fi

  # --- Pattern 2b: Unbalanced bold on speaker names ---
  # After Pattern 2 merges **\ lines, some speaker names may end up as:
  #   NAME** 1:23:45  (missing opening **)
  # Fix: Add opening ** to lines starting with a capitalized name followed by **
  count_before="$(grep -cE '^[A-Z][a-zA-Z]+ [A-Z][a-zA-Z ]*\*\*' "$tmpfile" 2>/dev/null || true)"
  if [ "$count_before" -gt 0 ]; then
    sed -i -E 's/^([A-Z][a-zA-Z]+ [A-Z][a-zA-Z ]*)(\*\*)/\*\*\1\2/g' "$tmpfile"
    changes=$((changes + count_before))
    echo "  [$filename] Fixed $count_before unbalanced bold speaker name(s)"
  fi

  # --- Pattern 3: Trailing backslashes ---
  # Remove \ at end of lines (pandoc hard line breaks)
  count_before="$(grep -c '\\$' "$tmpfile" 2>/dev/null || true)"
  if [ "$count_before" -gt 0 ]; then
    sed -i 's/\\$//' "$tmpfile"
    # Recount to see actual changes (some might have been false positives)
    count_after="$(grep -c '\\$' "$tmpfile" 2>/dev/null || true)"
    local p3_count=$((count_before - count_after))
    if [ "$p3_count" -gt 0 ]; then
      changes=$((changes + p3_count))
      echo "  [$filename] Removed $p3_count trailing backslash(es)"
    fi
  fi

  # --- Pattern 4: Escaped apostrophes ---
  # Replace \' with '
  count_before="$(grep -c "\\\\'" "$tmpfile" 2>/dev/null || true)"
  if [ "$count_before" -gt 0 ]; then
    sed -i "s/\\\\'/'/g" "$tmpfile"
    changes=$((changes + count_before))
    echo "  [$filename] Fixed escaped apostrophes in $count_before line(s)"
  fi

  # --- Pattern 5: Multiple consecutive blank lines ---
  # Collapse 2+ blank lines to a single blank line
  # Use awk for portable multi-line handling
  awk '
    /^[[:space:]]*$/ {
      if (!blank) { print ""; blank=1 }
      next
    }
    { blank=0; print }
  ' "$tmpfile" > "${tmpfile}.awk"
  local orig_blanks new_blanks
  orig_blanks="$(grep -c '^[[:space:]]*$' "$tmpfile" 2>/dev/null || true)"
  new_blanks="$(grep -c '^[[:space:]]*$' "${tmpfile}.awk" 2>/dev/null || true)"
  local p5_count=$((orig_blanks - new_blanks))
  mv "${tmpfile}.awk" "$tmpfile"
  if [ "$p5_count" -gt 0 ]; then
    changes=$((changes + p5_count))
    echo "  [$filename] Collapsed $p5_count excess blank line(s)"
  fi

  # --- Apply changes ---
  if [ "$changes" -gt 0 ]; then
    cp "$tmpfile" "$file"
    echo "  [$filename] ✓ $changes cleanup(s) applied"
  else
    echo "  [$filename] — no changes needed"
    # Remove unnecessary backup if no changes were made
    if [ "$NO_BACKUP" = false ] && [ -f "${file}.bak" ]; then
      rm -f "${file}.bak"
    fi
  fi
}

# --- Main ---------------------------------------------------------------------

echo "docx-to-markdown cleanup"
echo "========================"
echo "Processing ${#FILES[@]} file(s)..."
echo ""

total_processed=0

for file in "${FILES[@]}"; do
  cleanup_file "$file"
  total_processed=$((total_processed + 1))
done

echo ""
echo "Done. Processed $total_processed file(s)."
if [ "$NO_BACKUP" = false ]; then
  echo "Backups saved as .bak files (only for files with changes)."
  echo "Use --no-backup to skip backup creation."
fi
