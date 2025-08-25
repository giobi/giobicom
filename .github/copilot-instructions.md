# GitHub Copilot Instructions for Giobi.com Repository

**ALWAYS reference these instructions first and only fallback to additional search and context gathering if the information in the instructions is incomplete or found to be in error.**

This is an Astro-based static website for giobi.com, a web development company specializing in Laravel and WordPress projects. The site uses Tailwind CSS for styling and GitHub Pages for deployment.

## Working Effectively

### Initial Setup and Dependencies
Run these commands to set up a fresh development environment:

```bash
# Install Node.js dependencies
npm install  # Takes ~35 seconds

# Verify setup with a test build
npm run build  # Takes 3-4 seconds. NEVER CANCEL - very fast build.
```

### Core Development Commands
- **Development server**: `npm run dev` - Starts local server at http://localhost:4321/giobicom25 (or next available port)
- **Production build**: `npm run build` - Takes 3-4 seconds. NEVER CANCEL. Set timeout to 60+ seconds for safety.
- **Preview built site**: `npm run preview` - Serves the built static files
- **Format code**: `npm run format` - Uses Prettier to format Astro, TypeScript, and CSS files
- **Lint code**: `npm run lint` - ESLint validation (may have parsing warnings in existing code - this is normal)

### CRITICAL TIMING EXPECTATIONS
- **Build time**: 3-4 seconds (extremely fast, not 45+ minutes like some projects)
- **npm install**: ~35 seconds
- **Development server startup**: ~1 second
- **NEVER CANCEL any npm commands** - even though they're fast, always wait for completion

## Validation Requirements

### Manual Testing Scenarios
After making changes, ALWAYS test these core user scenarios:

1. **Homepage Navigation**: 
   - Visit http://localhost:4321/giobicom25
   - Test navigation between sections (Home, Servizi, Portfolio, Blog, FAQ, Contatti)
   - Verify responsive design on different viewport sizes

2. **Blog Functionality**:
   - Navigate to `/blog` 
   - Click on individual blog posts
   - Verify markdown content renders correctly
   - Test that blog post dates and tags display properly

3. **FAQ Section**:
   - Navigate to `/faq`
   - Verify FAQ items load from markdown content
   - Test that categories group correctly

4. **Content Collections Workflow**:
   - Add new blog post: Create `.md` file in `src/content/blog/`
   - Add new FAQ: Create `.md` file in `src/content/faq/`
   - Verify content appears after restart/rebuild

5. **Build Verification**:
   - Run `npm run build`
   - Verify `dist/` directory contains all expected files
   - Run `./scripts/check-pages-config.sh` to test GitHub Pages configuration

### GitHub Pages Deployment Testing
```bash
# Test GitHub Pages configuration
./scripts/check-pages-config.sh

# The script verifies:
# - .nojekyll file exists
# - GitHub Actions workflow is configured
# - Build process works correctly
# - dist/ directory is created properly
```

### Pre-commit Validation Checklist
ALWAYS run these commands before pushing changes:

```bash
npm run format     # Format code with Prettier
npm run lint       # ESLint check (ignore existing parsing warnings)
npm run build      # Verify build succeeds
```

## Repository Structure and Navigation

### Key Directories
- `src/pages/` - Astro page components (main routes)
- `src/components/` - Reusable Astro components (Header, Footer, GoogleMap, Particles)
- `src/content/` - Content Collections (blog posts and FAQ in Markdown)
- `src/layouts/` - Page layout templates
- `src/styles/` - Global CSS and Tailwind styles
- `.github/workflows/` - GitHub Actions for automated deployment
- `docs/` - Project documentation
- `scripts/` - Utility scripts

### Content Management (Astro Content Collections)
The site uses Astro Content Collections for structured content:

**Blog Posts** (`src/content/blog/*.md`):
```markdown
---
title: "Your Blog Post Title"
description: "SEO-friendly description"
author: "giobi.com"
date: 2024-01-15
tags: ["Laravel", "PHP", "Web Development"]
featured: true
---

# Your content here in Markdown
```

**FAQ Items** (`src/content/faq/*.md`):
```markdown
---
question: "Your question here?"
category: "Category Name"
order: 1
featured: true
---

Answer content in Markdown format.
```

### Configuration Files
- `astro.config.mjs` - Astro configuration with GitHub Pages settings
- `package.json` - Dependencies and npm scripts
- `tailwind.config.cjs` - Tailwind CSS configuration
- `tsconfig.json` - TypeScript configuration
- `.eslintrc.json` - ESLint configuration (basic Astro support)

## GitHub Copilot Agent Integration

### AI Agent Workflow
This repository includes comprehensive AI agent specifications in `agents.md`:

1. **Frontend Development Agent** - Astro/TypeScript/Tailwind work
2. **WordPress Development Agent** - Custom theme development
3. **Laravel Development Agent** - Backend API development
4. **Performance Optimization Agent** - Speed and SEO optimization
5. **Content Management Agent** - Blog and FAQ content
6. **DevOps & Automation Agent** - CI/CD and deployment

### Working with Agents
- Consult `agents.md` for specific agent capabilities and examples
- Use the defined workflows in `agents/workflows/` for standardized processes
- Reference prompt templates in `agents/prompts/` for common tasks

## Common Issues and Troubleshooting

### ESLint Parsing Warnings
**Issue**: ESLint shows parsing errors for Astro components
**Solution**: This is normal with the current configuration. The build still works correctly.
```bash
# These warnings are expected and can be ignored:
# - "Parsing error: Unknown token"
# - "Unexpected token" in .astro files
```

### Build Issues
**Issue**: Build fails with module errors
**Solution**: 
```bash
# Clear dependencies and reinstall
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Development Server Issues
**Issue**: Port conflicts or server won't start
**Solution**: Astro automatically tries alternative ports (4322, 4323, etc.)

### GitHub Pages Deployment Issues
**Issue**: Site not deploying or Jekyll errors
**Solution**: 
1. Ensure GitHub Pages source is set to "GitHub Actions" (not "Deploy from a branch")
2. Run `./scripts/check-pages-config.sh` for diagnostics
3. Check `.github/workflows/deploy.yml` configuration

### Missing Content
**Issue**: Blog posts or FAQ items not appearing
**Solution**:
1. Verify frontmatter format in markdown files
2. Check `src/content/config.ts` schema matches your content
3. Restart development server after adding new content files

## Environment Configuration

### Required Environment Variables
Copy `.env.example` to `.env` and configure:

```bash
# Google Maps integration (optional)
GOOGLE_MAPS_API_KEY=your_api_key_here

# Development settings
NODE_ENV=development
```

### Optional Integrations
- **Google Maps**: For contact page location display
- **Formspree**: For contact form functionality (see `setup.md`)
- **Google Analytics**: For visitor tracking

## Multi-language Support

The site includes content in both Italian and English:
- Primary language: Italian (interface and main content)
- Secondary: English (technical documentation)
- Always maintain language consistency when editing content
- Blog posts and FAQ can be in Italian, with English technical terms where appropriate

## Important Notes

### File Naming Conventions
- Astro components: PascalCase (e.g., `Header.astro`)
- Content files: kebab-case (e.g., `laravel-best-practices.md`)
- Pages: kebab-case (e.g., `contact-us.astro`)

### Best Practices
- Always test responsive design changes on multiple screen sizes
- Use semantic HTML elements for accessibility
- Follow the existing retro/terminal-inspired design theme
- Maintain the green color scheme defined in Tailwind config
- Test both development and production builds

### Performance Considerations
- Static site generation means very fast page loads
- Images are optimized automatically by Astro
- CSS is purged automatically by Tailwind in production
- Use Web Components sparingly to maintain performance

## Emergency Procedures

### If Build is Completely Broken
```bash
# Nuclear option - reset to clean state
git checkout -- .
npm install
npm run build
```

### If Deployment Fails
1. Check GitHub Actions logs in repository
2. Verify GitHub Pages settings: Settings > Pages > Source = "GitHub Actions"
3. Run local build test: `npm run build && ./scripts/check-pages-config.sh`
4. Check for missing `.nojekyll` file in root directory

### If Content Collections Break
1. Verify schema in `src/content/config.ts`
2. Check frontmatter format in content files
3. Clear Astro cache: `rm -rf .astro`
4. Restart development server

This repository is optimized for rapid development and deployment. The extremely fast build times (3-4 seconds) make iteration quick and efficient.