# Global Preferences

## Workflow

- Before implementing, present a plan and wait for approval. For ambiguous requests, conduct a requirements hearing with specific questions rather than asking open-ended 'which direction?'
- For any task touching >1 file or requiring design choices, first output: (1) your understanding of the goal, (2) 2-3 approach options with tradeoffs, (3) recommended approach. Wait for my approval before editing.
- Before declaring a bug fixed: (1) reproduce it, (2) state the root cause in one sentence, (3) apply the fix, (4) reproduce again to confirm. Show me each step.

## Communication

- Always respond in Japanese
- Be concise and omit obvious explanations
- For any output longer than ~100 lines, write it to a file under ./tmp/ or ./docs/ and give me a short summary with the file path. Never dump long content inline.

## Conventions

- Write commit messages in English using Conventional Commits format
- Write code comments in English

## Code Changes

- When fixing lockfiles or config files, produce the MINIMAL diff. Do not regenerate or reformat unrelated content.

## Testing / Commits

- For TDD spec tasks: implement → run tests → commit per phase. Do not batch multiple phases into one commit.

## Git

- Do not run git push without confirmation

## Security

- Never disable sandbox or write secrets/API keys to disk/logs without explicit permission. If blocked, report and ask.

## Citing Specifications

- When referencing a specification — RFC, W3C/WHATWG, ECMA/ISO, or a vendor's official documentation — or when asserting spec-defined behavior ("the spec says...", "per the standard..."), cite a primary source rather than a secondary explanation.
- Before presenting the citation, fetch the URL with WebFetch in the same turn and confirm the quoted text appears in the retrieved content. Keep quotes to a single sentence or clause so verbatim matching is realistic.
- Tag each cited URL inline with its verification state in the reply: `(verified)` when fetched and matched this turn, `(unverified)` otherwise. Do not omit the tag.
- If fetching fails, the page does not contain the claim, or verification is otherwise impossible, say so plainly and do not invent or paraphrase a source into existence.
