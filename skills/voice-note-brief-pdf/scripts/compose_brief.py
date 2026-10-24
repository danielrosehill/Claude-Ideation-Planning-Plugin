#!/usr/bin/env python3
"""Compose a project-brief markdown file from a front-matter file and section documents.

Usage: python3 -I compose_brief.py <front.yaml> <out.md> "Section title=path.md" [...]

Each section becomes a level-1 heading. The section file's own first level-1 heading is
dropped, any later level-1 headings are demoted to level 2, and relative links are
reduced to their text (they don't resolve inside a PDF). http(s) links are kept.
Fenced code blocks are left alone.
"""
import re
import sys

LINK = re.compile(r"\[([^\]]+)\]\((?!https?://|mailto:)[^)]*\)")


def section(path):
    out, fence, dropped = [], False, False
    for line in open(path, encoding="utf-8").read().splitlines():
        if line.lstrip().startswith("```"):
            fence = not fence
            out.append(line)
            continue
        if not fence:
            if line.startswith("# "):
                if not dropped:
                    dropped = True
                    continue
                line = "#" + line
            line = LINK.sub(r"\1", line)
        out.append(line)
    return "\n".join(out).strip()


def main():
    front, dest, *parts = sys.argv[1:]
    body = [open(front, encoding="utf-8").read().strip()]
    for part in parts:
        title, path = part.split("=", 1)
        body.append(f"# {title}\n\n{section(path)}")
    open(dest, "w", encoding="utf-8").write("\n\n".join(body) + "\n")
    print(dest)


if __name__ == "__main__":
    main()
