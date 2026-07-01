---
name: readme-writer
description: Write or update a project's README.md following a specific house style (emoji section headers, short intro, Implementation Details, Install Instructions, Build Instructions, Release process). Use when the user asks to create, write, generate, or overhaul a README for a project.
---

# README Writer

Write a `README.md` that follows this house style, modeled on the FS25_StatsExtended mod README. The style favors a short, scannable structure over prose-heavy documentation.

## Structure

1. **Title line** — `# :emoji: <Project Name>` — one relevant emoji shortcode as a badge-like prefix, then the project name.
2. **One-sentence description** — immediately under the title, plain text, no header. States what the project does and for whom, in one sentence.
3. **Screenshot/demo image** (if applicable) — a single image link right after the description, before any other section, if the project has a visual UI. Skip if not applicable (e.g. a library or CLI tool).
4. **`## :spiral_notepad: Implementation Details`** — explains *what* the project does from a user's perspective (not architecture/code internals — that belongs in CLAUDE.md or a CONTRIBUTING doc, not the README). Use `###` subsections and bullet lists for distinct features or components. Bullets use **Bold Term** : description format for field/column-style breakdowns.
5. **`## :gear: Manual Install Instructions`** (or `## :gear: Install Instructions` for non-manual installs) — numbered steps, terse, imperative.
6. **`## :hammer_and_wrench: Manual Build Instructions`** (or `## :hammer_and_wrench: Build Instructions`) — the exact build command(s) in a fenced code block. If there is no build step, state that plainly instead of inventing one.
7. **`## :rocket: Release`** — the exact release process (tagging convention, push commands, CI trigger, publish command) in a fenced code block, if the project has a release process. Omit this section if there isn't one.

## Process

1. **Investigate before writing.** Don't invent install/build/release steps. Check, in order:
   - `CLAUDE.md` or `AGENTS.md` for documented build/test/release commands
   - `package.json` scripts, `Makefile`, `modDesc.xml`, or equivalent build manifest
   - `.github/workflows/*` for CI-driven release/tag conventions
   - Existing `README.md` (if updating rather than creating) for install instructions already validated by the maintainer
   - Git tags (`git tag -l`) to infer the release/tagging convention if not documented anywhere
2. **Match emoji to content**, don't reuse the exact FS25_StatsExtended emoji set verbatim unless it fits — e.g. `:trophy:` was specific to that project's achievement-tracking theme. Pick emoji shortcodes that fit each project's actual subject matter (a header still gets a relevant emoji, sections still get :spiral_notepad:, :gear:, :hammer_and_wrench:, :rocket: unless a better fit is obvious).
3. **Keep it terse.** No marketing language, no "Getting Started" fluff, no badges/shields unless the project already uses them. Every section should be information a user or contributor actually needs.
4. **Omit sections that don't apply** rather than filling them with placeholder or speculative content. A library with no GUI skips the screenshot; a project with no formal release process skips the Release section.
5. If facts are missing or ambiguous (e.g. no discoverable release process, no obvious install path), ask the user rather than guessing.

## Reference example

The canonical example this style is drawn from:

```markdown
# :trophy: SE - Farming Simulator 25 Stats Extended
SE adds a new tab to the in-game Statistics screen that displays all achievements and farm statistics for the active savegame.

![screenshot 1](https://github.com/EvanKirsch/fs25-stats-extended/blob/master/screenshots/screenshot-1.png)

## :spiral_notepad: Implementation Details
Adds a new "Statistics Extended" tab into the existing statistics menu. The tab is split into two sections.

### Achievements List
- **Name** : The achievement's display name
- **Description** : A description of what I _believe_ to be the unlock condition
- **Progress** : Current progress toward the target. Shows "Unlocked" once the achievement is earned
Displays all achievements registered with `g_achievementManager`.

### Farm Statistics List
- **Statistic** : Display name of the statistic
- **Session** : The value accumulated in the current play session
- **Total** : The all-time total for the savegame
Displays raw farm stats from the active save, covers breeding counts, distances traveled, field area worked, time spent on tasks, resource usage, harvests, bales, wood, and more. Some of these are duplicated from the existing "Statistics" tab

## :gear: Manual Install Instructions
1. Download `FS25_StatsExtended_update.zip` from the latest release on the [releases page](https://github.com/EvanKirsch/fs25-stats-extended/releases)
2. Move your downloaded copy of `FS25_StatsExtended_update.zip` to `Documents\My Games\Farming Simulator 2025\mods`

## :hammer_and_wrench: Manual Build Instructions
`git archive -o FS25_StatsExtended.zip HEAD`

## :rocket: Release
Create and push a tag on the desired release commit following the pattern `[0-9]+.[0-9]+.[0-9]+.[0-9]+`

\`\`\`bash
git tag <tagname>
git push origin <tagname>
\`\`\`
```
