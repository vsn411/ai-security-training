#!/bin/bash
set -e

echo "Starting Aria Agent (Week 13)..."
echo ""

# Activate venv if present
if [ -d "venv" ]; then
  source venv/bin/activate
fi

# Start FastAPI in background
uvicorn api:app --port 8000 &
API_PID=$!
sleep 3

# Start Chainlit
chainlit run chainlit_app.py --port 8001 &
CHAINLIT_PID=$!

echo "════════════════════════════════════"
echo "  Aria Agent — Running"
echo "════════════════════════════════════"
echo "  Chat UI  → http://localhost:8001"
echo "  REST API → http://localhost:8000"
echo "  API Docs → http://localhost:8000/docs"
echo "════════════════════════════════════"
echo "  Press Ctrl+C to stop"
echo ""

trap "echo 'Stopping...'; kill $API_PID $CHAINLIT_PID 2>/dev/null" INT
wait
