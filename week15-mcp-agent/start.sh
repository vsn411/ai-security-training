#!/bin/bash
set -e

echo "Starting Aria MCP Agent (Week 15)..."
echo ""

if [ -d "venv" ]; then
  source venv/bin/activate
fi

# MCP servers are launched as subprocesses by mcp_client.py — no manual start needed

uvicorn api:app --port 8000 &
API_PID=$!
sleep 4   # Allow time for MCP connections to establish

chainlit run chainlit_app.py --port 8001 &
CHAINLIT_PID=$!

echo ""
echo "════════════════════════════════════════════"
echo "  Aria MCP Agent — Running"
echo "════════════════════════════════════════════"
echo "  Chat UI    → http://localhost:8001"
echo "  REST API   → http://localhost:8000"
echo "  Tools      → GET /tools"
echo "  Audit log  → GET /tool-audit-log"
echo "════════════════════════════════════════════"
echo "  Press Ctrl+C to stop"
echo ""

trap "kill $API_PID $CHAINLIT_PID 2>/dev/null" INT
wait
