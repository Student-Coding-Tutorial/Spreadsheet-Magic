# Spreadsheet-Magic

Crash course on how to use spreadsheets.

## Publishing pages

The GitHub Actions workflow builds and deploys this repository to GitHub Pages when changes are pushed to `main` (or manually from the Actions tab). Add `.md` or `.html` files at the repository root or in subdirectories:

- `page1.md` is published at `/page1/` as `page1/index.html`.
- `page1/help.md` is published at `/page1/help/` as `page1/help/index.html`.
- HTML files are published in the same way, with their contents preserved.

GitHub-style alerts are supported in Markdown:

```markdown
> [!NOTE]
> This is a note.
```
