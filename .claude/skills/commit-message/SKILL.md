---
name: commit-message
description: Draft a conventional-commit-style commit message for the repository's current uncommitted changes (staged and/or unstaged), tagging the GitHub issue it addresses. Use this whenever the user asks you to write/suggest/draft a commit message, summarize uncommitted changes for a commit, or says something like "commit this", "what should the commit message be", or "tag the issue in the commit" — but do NOT run `git commit` unless the user explicitly says to commit. Always trigger this for commit message requests even if the user doesn't mention "conventional commits" by name.
---

# Commit Message Drafting

Produce a single-line commit message for the repo's uncommitted changes, in the
exact form:

```
type(#XX): subject
```

or, if no issue number can be found, just:

```
type: subject
```

The entire message — type, issue reference, and subject — must be **all lower
case**. This isn't a style nitpick: it's so the message behaves correctly in
case-insensitive tooling/environments the user relies on. Do not capitalize
proper nouns, acronyms, or the first word of the subject.

## Step 1: Gather the change

Run these to see what's actually changed (uncommitted = staged + unstaged):

```bash
git status --short
git diff HEAD
```

If nothing is uncommitted, say so and stop — don't invent a message for a
clean tree.

Read enough of the diff to understand *what changed and why*, not just which
files touched. A file list is not a summary.

## Step 2: Pick the type

Use standard conventional-commit types, whichever best fits the dominant
change (if a diff mixes concerns, pick the type for the primary intent —
don't try to encode multiple types):

| type | when |
|---|---|
| `feat` | new user-facing capability |
| `fix` | bug fix |
| `docs` | documentation only |
| `style` | formatting/whitespace, no logic change |
| `refactor` | code restructuring, no behavior change |
| `perf` | performance improvement |
| `test` | adding/adjusting tests |
| `chore` | tooling, deps, build config, misc maintenance |
| `build` | build system or packaging changes |
| `ci` | CI/CD pipeline changes |
| `revert` | reverts a previous commit |

## Step 3: Find the issue number

Try these in order, and stop at the first match — don't guess or fabricate a
number if none of them turn one up:

1. **Branch name.** Look for a number in the current branch
   (`git branch --show-current`), e.g. `fix/123-something`, `123-foo`,
   `feature/GH-123`, `issue-123`. Extract the digits.
2. **Diff/commit context.** Scan the diff and recent log
   (`git log -5 --oneline`) for an explicit `#123` reference — e.g. a
   changelog entry, code comment, or prior commit that names the issue this
   change continues.
3. **No match found.** Omit the `(#XX)` segment entirely rather than
   inventing a plausible-looking number. A missing tag is correct; a wrong
   tag is misleading and worse than no tag.

If you find a candidate number but you're not confident it's actually the
issue this change addresses (e.g. it's just the branch's base ticket, or it
appears in unrelated context), say so to the user instead of silently
including it.

## Step 4: Write the subject

Imperative mood, present tense, no trailing period, all lower case, concise
(aim for under ~65 characters after the `type(#XX): ` prefix, but clarity
wins over hitting a number). Describe *what the change does*, not the
mechanics of how it was implemented.

## Output

State the final message on its own line, e.g.:

```
fix(#20): correct paging name and elt
```

Then briefly note which files/diff it's based on and, if no issue number was
found, say that explicitly rather than leaving it ambiguous whether you
looked.

Do not run `git commit` — only propose the message — unless the user's
request explicitly asks you to create the commit (e.g. "commit this with that
message"). If they do, follow the repo's normal commit process (staging,
heredoc message, etc.) rather than a bare `git commit -m`.
