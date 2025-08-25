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

#### Jekyll Processing Error (Astro Files)
If you see errors like "Invalid YAML front matter" or "mapping values are not allowed" when Jekyll tries to process `.astro` files, this indicates GitHub Pages is incorrectly configured:

**❌ Error symptoms:**
- Jekyll trying to process Astro files in `src/` directory
- YAML errors on Astro component files
- Build failing with Jekyll-specific errors

**✅ Solution:**
1. Go to repository **Settings** → **Pages**
2. Under **Source**, change from "Deploy from a branch" to **"GitHub Actions"**
3. Save the settings
4. The next push to main will use the proper Astro workflow instead of Jekyll

This happens when GitHub Pages defaults to Jekyll processing instead of using the custom GitHub Actions workflow defined in `.github/workflows/deploy.yml`.

**📖 Detailed Fix Guide:** See [PAGES-FIX.md](PAGES-FIX.md) for step-by-step instructions.

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
- **Source**: GitHub Actions ⚠️ **IMPORTANT: Must be set to "GitHub Actions", not "Deploy from a branch"**
- **Base Path**: `/giobicom25` (configured in astro.config.mjs)

#### How to Verify/Fix GitHub Pages Source Setting

1. Go to your repository on GitHub
2. Click **Settings** tab
3. Scroll down to **Pages** section in the left sidebar
4. Under **Source**, ensure it's set to **"GitHub Actions"**
5. If it shows "Deploy from a branch", change it to "GitHub Actions"
6. Click **Save**

❌ **Wrong setting:** "Deploy from a branch" causes Jekyll to process Astro files and fail  
✅ **Correct setting:** "GitHub Actions" uses the custom Astro workflow

---

For more information, see the [Astro deployment documentation](https://docs.astro.build/en/guides/deploy/github/).