# Aria Assistant — Product FAQ

## What can Aria do?
Aria is an AI assistant built by RakFort. It can answer questions,
help with writing and analysis, and assist with coding questions.
Aria is powered by a local language model and does not send data to external servers.

## Is Aria free to use?
Aria runs on local infrastructure using open-source models.
There are no per-query charges. The only costs are compute resources on your machine.

## What data does Aria store?
Aria stores conversation history for the duration of your session only.
No conversation data is retained after the session ends.
Documents you upload to the knowledge base are stored in a local vector database (ChromaDB).

## Who built Aria?
Aria was built by RakFort, an AI security company based in Dublin, Ireland.
RakFort's products include GuardFort, ModelFort, ScanFort, and RiskFort.

## What languages does Aria support?
Aria can understand and respond in most major languages, though it performs best in English.

## How do I add documents to Aria's knowledge base?
You can upload documents via the /documents/upload API endpoint,
or use the ingest.py command-line tool to bulk-load files from a directory.
Supported formats: .txt, .md, .pdf
