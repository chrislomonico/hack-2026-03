---
name: "docx-to-markdown"
description: "Convert .docx files to clean markdown using pandoc with automated cleanup"
domain: "document-conversion"
confidence: "medium"
source: "earned"
---

# docx-to-markdown

Convert `.docx` files to clean, well-formatted markdown using pandoc, then apply automated cleanup to remove common conversion artifacts.

## Prerequisites

- **pandoc** (v3.1+) must be available on the `PATH`. In this project, pandoc v3.1.3 is included in the devcontainer. If pandoc is not available, add it to `.devcontainer/devcontainer.json` via a feature or install it manually.
- **bash** (for the cleanup script) — available in all standard environments.
- **sed** — GNU or BSD sed (the cleanup script is portable across both).

## Step-by-Step Process

### 1. Convert `.docx` to markdown with pandoc

```bash
pandoc -f docx -t markdown --wrap=none INPUT.docx -o OUTPUT.md
```

**Flags explained:**

| Flag          | Purpose                                                        |
| ------------- | -------------------------------------------------------------- |
| `-f docx`     | Input format: Word document                                    |
| `-t markdown` | Output format: pandoc markdown (preserves the most formatting) |
| `--wrap=none` | Disable hard line wrapping (avoids mid-sentence line breaks)   |

**Optional flags:**

| Flag                      | When to use                                                                                                             |
| ------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `--extract-media=./media` | Only if the document contains meaningful images (diagrams, charts). Skip for decorative images like avatars or icons.   |
| `-t gfm`                  | Use GitHub-Flavored Markdown if you need GFM table syntax or strikethrough. Plain `markdown` preserves more formatting. |

**Batch conversion** (all `.docx` files in a directory):

```bash
for f in /path/to/dir/*.docx; do
  pandoc -f docx -t markdown --wrap=none "$f" -o "${f%.docx}.md"
done
```

### 2. Clean up pandoc artifacts

After conversion, run the cleanup script included with this skill:

```bash
# Single file
.github/skills/docx-to-markdown/cleanup.sh OUTPUT.md

# All .md files in a directory
.github/skills/docx-to-markdown/cleanup.sh /path/to/dir/

# Skip backup creation
.github/skills/docx-to-markdown/cleanup.sh --no-backup OUTPUT.md
```

The cleanup script is idempotent — safe to run multiple times on the same file.

### 3. Review the output

After cleanup, review the markdown for:

- Correct structure and readability
- Any remaining formatting issues specific to the source document
- Whether headers should be added (some Word documents use bold text for structure instead of heading styles)

### 4. Offer to delete original `.docx` files

After conversion and cleanup are complete, **ask the user** if they would like to delete the original `.docx` source files. Do not delete automatically — always confirm first.

- If the user says **yes**, delete the `.docx` files that were successfully converted.
- If the user says **no** or skips, leave the originals in place.

This keeps the directory clean while giving the user control over when source files are removed.

## Cleanup Patterns

The cleanup script addresses these known pandoc conversion artifacts:

### Pattern 1: Media/image links

**What it looks like:**

```markdown
![](media/image1.png){width="0.3333333333333333in" height="0.3333333333333333in"}
```

**Action:** Remove the entire line. These are typically inline images (avatars, icons) that have no value in markdown. If the document contains meaningful images, extract them separately with `--extract-media` and re-link manually.

### Pattern 2: Orphaned bold markers

**What it looks like:**

```markdown
**\
SPEAKER NAME** 1:23:45
```

**Action:** Merge into a single line: `**SPEAKER NAME** 1:23:45`. This happens when pandoc splits bold-formatted text across line boundaries.

### Pattern 2b: Unbalanced bold on speaker names

**What it looks like (after Pattern 2 merge):**

```markdown
Luis Marques\*\* 0:21
```

**Action:** Add the missing opening `**` to produce `**Luis Marques** 0:21`. This occurs when Pattern 2 merges `**\` with the next line but the result is still missing the opening bold marker. Only applies to lines starting with a capitalized name followed by `**`.

### Pattern 3: Trailing backslashes

**What it looks like:**

```markdown
Some text at the end of a paragraph\
```

**Action:** Remove the trailing `\`. Pandoc uses backslash for hard line breaks, but these are rarely intentional in converted documents.

### Pattern 4: Escaped apostrophes

**What it looks like:**

```markdown
It\'s a lovely day
```

**Action:** Replace `\'` with `'`. Pandoc sometimes escapes apostrophes unnecessarily.

### Pattern 5: Multiple consecutive blank lines

**What it looks like:**

```markdown
End of one section.

Start of next section.
```

**Action:** Collapse to a single blank line. Pandoc often produces excessive blank lines from Word document spacing.

## Known Use Cases

### Microsoft Teams meeting transcripts

Teams transcript exports (`.docx`) have specific characteristics:

- **No headers:** Structure uses bold text for speaker names (e.g., `**SPEAKER NAME** 0:03`), not markdown heading syntax.
- **Inline avatars:** Every speaker entry includes a small avatar image. These should be removed (Pattern 1 above).
- **Orphaned bold markers:** Very common in transcripts — the `**\` / `NAME**` split happens frequently (Pattern 2).
- **Recommendation:** Do NOT use `--extract-media` for transcripts. The only images are speaker avatars, which clutter the repo with no value.

### General Word documents

- Documents authored in Word may use bold numbered sections (e.g., `**1.0 Executive Summary**`) instead of heading styles. Consider manually converting these to proper markdown headers (`## 1.0 Executive Summary`) after conversion if structure matters.
- Tables convert reasonably well but may need manual cleanup for complex merged cells.
- Footnotes and endnotes are preserved but may need formatting adjustments.

## Edge Cases and Gotchas

1. **Password-protected files:** Pandoc cannot open password-protected `.docx` files. Remove protection in Word first.
2. **Track changes:** Pandoc processes the final accepted state. If you need to see tracked changes, accept/reject them in Word first.
3. **Embedded objects:** Excel charts, SmartArt, and other OLE objects will not convert. Extract them as images separately if needed.
4. **Right-to-left text:** May need additional pandoc flags or manual cleanup.
5. **Very large files:** Pandoc handles large documents well, but cleanup on files with thousands of lines may take a few seconds.
6. **Idempotency:** Both the pandoc conversion and cleanup script are idempotent. Re-running them on already-processed files is safe.
