---
title: "Test Blog Post - GitHub Copilot Instructions Validation"
description: "Test post created to validate the Content Collections workflow described in the GitHub Copilot instructions."
author: "giobi.com"
date: 2024-08-25
tags: ["Testing", "Validation", "Astro", "Content Collections"]
featured: false
---

# Test Blog Post for Validation

This blog post was created to validate that the Content Collections workflow described in the GitHub Copilot instructions works correctly.

## What This Tests

1. **Markdown frontmatter parsing** - Verifies the schema defined in `src/content/config.ts`
2. **Content rendering** - Ensures markdown content displays properly
3. **Build process** - Confirms new content is included in the build
4. **Development workflow** - Tests the complete developer experience

## Content Collections Schema

The post should include:
- ✅ title (string)
- ✅ description (string) 
- ✅ author (string, defaults to 'giobi.com')
- ✅ date (date)
- ✅ tags (array of strings)
- ✅ featured (boolean)

## Test Results

If you can read this content in the built site, the Content Collections workflow is working correctly and the GitHub Copilot instructions are accurate.

## Code Example

Here's some example TypeScript code to test syntax highlighting:

```typescript
// Astro Content Collections configuration
import { defineCollection, z } from 'astro:content';

const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string(),
    author: z.string().default('giobi.com'),
    date: z.date(),
    tags: z.array(z.string()).default([]),
    featured: z.boolean().default(false),
  }),
});

export const collections = { blog };
```

This test post should be automatically included in the blog listing and accessible via its own URL.