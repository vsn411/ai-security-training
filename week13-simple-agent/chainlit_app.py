import chainlit as cl
from agent_core import chat_stream


@cl.on_chat_start
async def on_chat_start():
    cl.user_session.set("history", [])
    await cl.Message(
        content="👋 Hi! I'm **Aria**, your AI assistant. How can I help you today?"
    ).send()


@cl.on_message
async def on_message(message: cl.Message):
    history = cl.user_session.get("history")
    response_msg = cl.Message(content="")
    await response_msg.send()
    async for token in cl.make_async(chat_stream)(history, message.content):
        await response_msg.stream_token(token)
    await response_msg.update()
