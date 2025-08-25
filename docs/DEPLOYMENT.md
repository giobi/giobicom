# GitHub Pages Deployment Guide

## How Deployment Works

This repository uses GitHub Actions to automatically deploy the website to GitHub Pages.

### Deployment Process

1. **Pull Requests**: When you create or update a pull request:
   - ✅ Build job runs to verify the code compiles correctly
   - ⏭️ Deploy job is skipped (intentionally)
   - 📝 Status shows build verification completed

2. **Main Branch**: When code is merged to `main` branch:
   - ✅ Build job runs and creates the website files
   - 🚀 Deploy job runs and publishes to GitHub Pages
   - 🌐 Website is updated at: https://giobi.github.io/giobicom25

### Troubleshooting

#### "Action Required" Status on PRs
This is normal behavior! The workflow shows "action required" because the deploy job is intentionally skipped for pull requests. This is the correct behavior to prevent deploying unreviewed changes.

#### Build Failures
If the build fails:
1. Check the Action logs in the GitHub Actions tab
2. Run `npm run build` locally to reproduce the issue
3. Fix any compilation or configuration errors
4. Push your changes to trigger a new build

#### Deployment Issues
If deployment fails on main branch:
1. Check that GitHub Pages is enabled in repository settings
2. Verify the source is set to "GitHub Actions"
3. Check for any permission issues in the Action logs

### Local Development

To test builds locally:
```bash
# Install dependencies
npm install

# Run development server
npm run dev

# Build for production (same as CI)
npm run build

# Preview production build
npm run preview
```

### Configuration Files

- `.github/workflows/deploy.yml` - GitHub Actions workflow
- `astro.config.mjs` - Astro configuration with GitHub Pages settings
- `package.json` - Build scripts and dependencies

### GitHub Pages Settings

The site is configured to deploy to:
- **URL**: https://giobi.github.io/giobicom25
- **Source**: GitHub Actions
- **Base Path**: `/giobicom25` (configured in astro.config.mjs)

---

For more information, see the [Astro deployment documentation](https://docs.astro.build/en/guides/deploy/github/).