# Website Versions Archive

This directory contains historical versions of the giobi.com website as static HTML files.

## Directory Structure

```
public/versions/
├── README.md          # This file
├── 20250121.html      # WordPress/Elementor version (original home-2024.html)
└── YYYYMMDD.html      # Future versions...
```

## URL Format

Versions are accessible via URLs like:
- `/giobicom25/versions/20250121.html` - Specific version
- `/giobicom25/versions/` - Index page listing all versions

## Adding New Versions

1. Export or save the current layout as a static HTML file
2. Name it using the format `YYYYMMDD.html` (e.g., `20250315.html`)
3. Place it in this directory (`public/versions/`)
4. Update the `versions` array in `src/pages/versions.astro` with metadata:

```javascript
{
  date: '20250315',
  title: 'Layout Name - Description',
  description: 'Detailed description of this version and what changed',
  issueNumber: '42', // or 'N/A' if no specific issue
  fileName: '20250315.html',
  features: [
    'Feature 1',
    'Feature 2',
    'Feature 3'
  ]
}
```

## Version Metadata

Each version should include:
- **date**: YYYYMMDD format for the version date
- **title**: Descriptive title for the version
- **description**: What this version represents and why it was created
- **issueNumber**: GitHub issue number that triggered this version (or 'N/A')
- **fileName**: The HTML file name
- **features**: Array of key features or characteristics

## Screenshot Recommendations

For better documentation, consider taking screenshots of each version and storing them in a `screenshots/` subdirectory with the same naming convention.

## Maintenance

- Keep versions sorted by date (newest first) in the versions.astro metadata
- Ensure HTML files are self-contained or that external resources are documented
- Consider file size limits for the repository when adding new versions