from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional
import uuid
from agent_core import chat

app = FastAPI(title="Aria Agent API", version="1.0.0")
app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"])

sessions: dict[str, list[dict]] = {}


class ChatRequest(BaseModel):
    message: str
    session_id: Optional[str] = None


class ChatResponse(BaseModel):
    session_id: str
    reply: str
    turn_count: int


@app.get("/health")
def health():
    return {"status": "ok", "model": "gemma2"}


@app.post("/chat", response_model=ChatResponse)
def chat_endpoint(req: ChatRequest):
    sid = req.session_id or str(uuid.uuid4())
    if sid not in sessions:
        sessions[sid] = []
    try:
        reply = chat(sessions[sid], req.message)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
    return ChatResponse(session_id=sid, reply=reply, turn_count=len(sessions[sid]) // 2)


@app.get("/session/{session_id}")
def get_session(session_id: str):
    if session_id not in sessions:
        raise HTTPException(status_code=404, detail="Session not found")
    h = sessions[session_id]
    return {"session_id": session_id, "turn_count": len(h) // 2, "history_preview": h[-4:]}


@app.delete("/session/{session_id}")
def clear_session(session_id: str):
    sessions.pop(session_id, None)
    return {"cleared": session_id}
