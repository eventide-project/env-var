#!/bin/sh
# Usage:
#
#   process-question-log.sh <log-directory>
#
# Reads a PostToolUse event for AskUserQuestion on standard input. Where the agent marked the
# selection as a process question, by setting metadata.source to "decision", writes one log entry
# to <log-directory> for each question it asked, with the engineer's answer. A selection without
# that marker is a mechanical question, and nothing is written for it.
#
# The plugin's hooks/process-question-log runs this. See the
# a-process-question-and-its-answer-are-logged rule.

directory=${1:?usage: process-question-log.sh <log-directory>}

exec python3 -c '
import json, os, re, subprocess, sys

directory = sys.argv[1]
apostrophe = chr(39)
event = json.load(sys.stdin)

tool_input = event.get("tool_input") or {}
if (tool_input.get("metadata") or {}).get("source") != "decision":
    sys.exit(0)

response = event.get("tool_response") or {}
questions = response.get("questions") or tool_input.get("questions") or []
answers = response.get("answers") or {}
annotations = response.get("annotations") or {}

prefix = subprocess.run(["date", "-u", "+%Y-%m-%dT%H-%M-%SZ"], capture_output=True, text=True).stdout.strip()

for question in questions:
    text = question.get("question", "")
    if text not in answers:
        continue
    answer = answers[text]
    first_line = text.strip().splitlines()[0] if text.strip() else question.get("header", "")

    slug = re.sub(r"[^a-z0-9]+", "-", first_line.lower()).strip("-")
    if len(slug) > 60:
        slug = slug[:61].rsplit("-", 1)[0]
    slug = slug or "question"
    path = os.path.join(directory, prefix + "-" + slug + ".md")
    number = 2
    while os.path.exists(path):
        path = os.path.join(directory, prefix + "-" + slug + "-" + str(number) + ".md")
        number += 1

    lines = ["# " + first_line + " — " + answer + ", selected by the engineer", "", "**Tags:** [decision]", ""]
    lines.append("The question, put through the selection interface:")
    lines.append("")
    lines += [("> " + line).rstrip() for line in text.splitlines()]
    lines.append("")
    lines.append("The options:")
    lines.append("")
    for option in question.get("options", []):
        lines.append("- **" + option.get("label", "") + "** — " + option.get("description", ""))
    lines.append("")
    lines.append("The engineer" + apostrophe + "s answer: **" + answer + "**")
    notes = (annotations.get(text) or {}).get("notes")
    if notes:
        lines.append("")
        lines.append("The engineer" + apostrophe + "s notes: " + notes)

    with open(path, "w") as entry:
        entry.write("\n".join(lines) + "\n")
' "$directory"
