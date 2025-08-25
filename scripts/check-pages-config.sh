#!/bin/bash

# GitHub Pages Configuration Checker
# This script helps diagnose common GitHub Pages deployment issues

echo "🔍 GitHub Pages Configuration Checker"
echo "======================================"
echo

# Check if we're in the right repository
if [ ! -f "astro.config.mjs" ]; then
    echo "❌ Error: This doesn't appear to be the giobicom25 Astro project"
    echo "   Make sure you're in the correct directory"
    exit 1
fi

echo "✅ Confirmed: This is an Astro project"
echo

# Check if required files exist
echo "📁 Checking deployment configuration files..."

if [ -f ".nojekyll" ]; then
    echo "✅ .nojekyll file exists (prevents Jekyll processing)"
else
    echo "❌ .nojekyll file missing"
fi

if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ GitHub Actions workflow exists"
else
    echo "❌ GitHub Actions workflow missing"
fi

if [ -f "package.json" ]; then
    echo "✅ package.json exists"
else
    echo "❌ package.json missing"
fi

echo

# Test build process
echo "🔧 Testing build process..."
if command -v npm >/dev/null 2>&1; then
    echo "✅ npm is available"
    
    if npm run build >/dev/null 2>&1; then
        echo "✅ Build successful"
        if [ -d "dist" ]; then
            echo "✅ dist/ directory created"
            file_count=$(find dist -type f | wc -l)
            echo "   Generated $file_count files"
        else
            echo "❌ dist/ directory not found after build"
        fi
    else
        echo "❌ Build failed - run 'npm run build' to see details"
    fi
else
    echo "❌ npm not available - please install Node.js and npm"
fi

echo

# Final recommendations
echo "📋 Next Steps:"
echo "=============="
echo

echo "If builds are failing with Jekyll errors:"
echo "1. Go to: https://github.com/giobi/giobicom25/settings/pages"
echo "2. Change 'Source' from 'Deploy from a branch' to 'GitHub Actions'"
echo "3. Save the settings"
echo "4. Push a change to trigger new deployment"
echo

echo "For detailed troubleshooting, see:"
echo "• docs/DEPLOYMENT.md - General deployment guide"
echo "• docs/PAGES-FIX.md - Specific GitHub Pages configuration fix"
echo

echo "🚀 Happy deploying!"