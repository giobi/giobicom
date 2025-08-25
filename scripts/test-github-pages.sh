#!/bin/bash

# Quick test to verify GitHub Pages configuration fix
# Run this after changing GitHub Pages source to "GitHub Actions"

echo "🔍 Testing GitHub Pages Configuration..."
echo "========================================"

BASE_URL="https://giobi.github.io/giobicom25"

echo "📋 Testing key URLs:"
echo ""

# Test main site
echo -n "Main Site: "
if curl -s -I "${BASE_URL}/" | grep -q "200 OK"; then
    echo "✅ WORKING"
else
    echo "❌ FAILED (likely still needs GitHub Pages source fix)"
fi

# Test status page
echo -n "Status Page: "
if curl -s -I "${BASE_URL}/status" | grep -q "200 OK"; then
    echo "✅ WORKING"
else
    echo "❌ FAILED"
fi

# Test diagnostic file
echo -n "Diagnostic File: "
if curl -s -I "${BASE_URL}/github-pages-diagnostic.txt" | grep -q "200 OK"; then
    echo "✅ WORKING"
else
    echo "❌ FAILED"
fi

echo ""
echo "🔧 If tests fail:"
echo "1. Go to: https://github.com/giobi/giobicom25/settings/pages"
echo "2. Change 'Source' from 'Deploy from a branch' to 'GitHub Actions'"
echo "3. Save and wait for next deployment"
echo ""
echo "📖 Full guide: See GITHUB_PAGES_FIX.md"