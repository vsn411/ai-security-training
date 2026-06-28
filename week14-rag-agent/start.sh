#!/bin/bash
set -e

echo "Starting Aria RAG Agent (Week 14)..."
echo ""

if [ -d "venv" ]; then
  source venv/bin/activate
fi

# Ingest sample docs if DB is empty
echo "Checking knowledge base..."
python ingest.py sample_docs/ 2>/dev/null || true

uvicorn api:app --port 8000 &
API_PID=$!
sleep 3

chainlit run chainlit_app.py --port 8001 &
CHAINLIT_PID=$!

echo ""
echo "════════════════════════════════════════"
echo "  Aria RAG Agent — Running"
echo "════════════════════════════════════════"
echo "  Chat UI      → http://localhost:8001"
echo "  REST API     → http://localhost:8000"
echo "  Upload docs  → POST /documents/upload"
echo "  List docs    → GET  /documents"
echo "════════════════════════════════════════"
echo "  Press Ctrl+C to stop"
echo ""

trap "kill $API_PID $CHAINLIT_PID 2>/dev/null" INT
wait
