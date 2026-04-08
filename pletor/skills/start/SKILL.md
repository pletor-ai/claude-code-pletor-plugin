---
name: start
description: Get started with Pletor. Shows your workflows, explains what you can do, and verifies your connection.
user-invocable: true
---

# Welcome to Pletor

You are helping the user get started with Pletor, an AI workflow automation platform. Follow these steps:

## Step 1: Verify Connection

Call the `search_workflows` MCP tool with an empty search to list the user's workflows. This verifies the connection and authentication.

If the call fails with an authentication error, tell the user:
> It looks like you're not logged in yet. Claude will open your browser to sign in to Pletor. Please complete the login and try again.

## Step 2: Show Summary

Once you have the workflow list, present a friendly summary:

- How many workflows the user has
- List the first 5 workflows by name with a brief description of each
- If the user has no workflows, suggest they explore templates

## Step 3: Show What's Possible

Tell the user they can interact with Pletor using natural language. Give these examples:

- **Run a workflow:** "Run my image generation workflow" or "Execute [workflow name]"
- **Upload assets:** "Upload this image and use it in my workflow"
- **Check status:** "What's the status of my last run?" or "Show me the results"
- **Find templates:** "Find a template for product photography" or "What templates are available?"
- **Explore models:** "What AI models are available?" or "Find a model for video generation"
- **Get help:** "How does the [node type] node work?" or "Search the docs for [topic]"

## Tone

Keep your responses warm, concise, and encouraging. The user may be non-technical — avoid jargon and explain things simply.
