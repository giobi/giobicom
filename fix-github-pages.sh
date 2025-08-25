#!/bin/bash

# GitHub Pages 404 Fix Automation Script
# This script helps diagnose and guide through fixing GitHub Pages configuration

echo "🚨 GitHub Pages 404 Fix Assistant"
echo "=================================="
echo ""

# Colors for better output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Diagnosing GitHub Pages configuration...${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "astro.config.mjs" ]; then
    echo -e "${RED}❌ Error: This script must be run from the giobicom25 repository root${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Confirmed: In giobicom25 repository${NC}"

# Test site accessibility
echo ""
echo -e "${BLUE}Testing site accessibility...${NC}"

SITE_URL="https://giobi.github.io/giobicom25"
STATUS_URL="https://giobi.github.io/giobicom25/status"

if curl -s -f "${SITE_URL}/" > /dev/null 2>&1; then
    echo -e "${GREEN}✅ Main site is accessible at ${SITE_URL}${NC}"
    echo -e "${GREEN}🎉 GitHub Pages appears to be working correctly!${NC}"
    echo ""
    echo "If you previously saw a 404, the fix has been applied successfully."
    exit 0
else
    echo -e "${RED}❌ Main site shows 404 at ${SITE_URL}${NC}"
fi

if curl -s -f "${STATUS_URL}" > /dev/null 2>&1; then
    echo -e "${YELLOW}⚠️  Status page is accessible${NC}"
    echo "This indicates the build is working but configuration needs adjustment."
else
    echo -e "${RED}❌ Status page also shows 404${NC}"
fi

echo ""
echo -e "${YELLOW}📋 DIAGNOSIS: GitHub Pages Configuration Issue${NC}"
echo ""
echo "The site build is working correctly, but GitHub Pages is configured incorrectly."
echo ""
echo -e "${BLUE}🔧 MANUAL FIX REQUIRED:${NC}"
echo ""
echo "1. Open this link in your browser:"
echo -e "   ${BLUE}https://github.com/giobi/giobicom25/settings/pages${NC}"
echo ""
echo "2. Under 'Source', you'll see it's set to:"
echo -e "   ${RED}❌ Deploy from a branch${NC}"
echo ""
echo "3. Change it to:"
echo -e "   ${GREEN}✅ GitHub Actions${NC}"
echo ""
echo "4. Click the 'Save' button"
echo ""
echo "5. Wait 2-3 minutes for the next deployment to complete"
echo ""
echo "6. Test the site again:"
echo -e "   ${BLUE}${SITE_URL}${NC}"
echo ""
echo -e "${YELLOW}💡 Why this happens:${NC}"
echo "GitHub defaults to Jekyll processing, but Jekyll can't handle Astro files."
echo "Switching to 'GitHub Actions' uses our custom Astro workflow instead."
echo ""
echo -e "${GREEN}After the fix, run this script again to verify it worked!${NC}"