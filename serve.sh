#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
PORT="${1:-8000}"

echo "Muscular site: http://localhost:${PORT}/"
echo "Press Ctrl+C to stop."
python3 -m http.server "$PORT"
