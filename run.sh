#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"
backend_dir="$repo_root/backend"
frontend_dir="$repo_root/frontend"
backend_pid=""
frontend_pid=""

is_listening() {
  local port="$1"
  lsof -nP -iTCP:"$port" -sTCP:LISTEN >/dev/null 2>&1
}

if [[ ! -d "$backend_dir/.venv" ]]; then
  echo "Missing backend virtual environment at backend/.venv"
  echo "Create it with: cd backend && /usr/local/bin/python3.12 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt"
  exit 1
fi

cleanup() {
  [[ -n "$backend_pid" ]] && kill "$backend_pid" 2>/dev/null || true
  [[ -n "$frontend_pid" ]] && kill "$frontend_pid" 2>/dev/null || true
}

trap cleanup EXIT INT TERM

cd "$backend_dir"
if is_listening 8000; then
  echo "Backend already listening on http://127.0.0.1:8000"
else
  source .venv/bin/activate
  uvicorn app:app --port 8000 >/tmp/agnews-backend.log 2>&1 &
  backend_pid=$!
fi

cd "$frontend_dir"
if is_listening 5500; then
  echo "Frontend already listening on http://127.0.0.1:5500"
else
  /usr/local/bin/python3.12 -m http.server 5500 >/tmp/agnews-frontend.log 2>&1 &
  frontend_pid=$!
fi

echo "Backend:  http://127.0.0.1:8000"
echo "Frontend: http://127.0.0.1:5500"
echo "Logs: /tmp/agnews-backend.log and /tmp/agnews-frontend.log"
echo "Press Ctrl+C to stop both servers."

if [[ -n "$backend_pid" && -n "$frontend_pid" ]]; then
  wait "$backend_pid" "$frontend_pid"
elif [[ -n "$backend_pid" ]]; then
  wait "$backend_pid"
elif [[ -n "$frontend_pid" ]]; then
  wait "$frontend_pid"
fi