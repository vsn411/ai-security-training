from typing import Generator
from config import SYSTEM_PROMPT, MODEL_NAME, MAX_HISTORY_TURNS, MAX_TOKENS
import ollama


def build_messages(history: list[dict], user_message: str) -> list[dict]:
    messages = [{"role": "system", "content": SYSTEM_PROMPT}]
    messages.extend(history[-(MAX_HISTORY_TURNS * 2):])
    messages.append({"role": "user", "content": user_message})
    return messages


def chat(history: list[dict], user_message: str) -> str:
    """Single-turn chat. Appends the new turn to history in-place."""
    messages = build_messages(history, user_message)
    response = ollama.chat(
        model=MODEL_NAME,
        messages=messages,
        options={"num_predict": MAX_TOKENS},
    )
    reply = response["message"]["content"]
    history.append({"role": "user", "content": user_message})
    history.append({"role": "assistant", "content": reply})
    return reply


def chat_stream(history: list[dict], user_message: str) -> Generator[str, None, str]:
    """Streaming chat. Yields tokens as they arrive."""
    messages = build_messages(history, user_message)
    full_reply = ""
    for chunk in ollama.chat(model=MODEL_NAME, messages=messages, stream=True,
                              options={"num_predict": MAX_TOKENS}):
        token = chunk["message"]["content"]
        full_reply += token
        yield token
    history.append({"role": "user", "content": user_message})
    history.append({"role": "assistant", "content": full_reply})
    return full_reply
