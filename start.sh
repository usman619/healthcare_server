#!/bin/bash
apt-get update && apt-get install -y ffmpeg
pip install --no-cache-dir -r requirements.txt
uvicorn app.server:app --host=0.0.0.0 --port=8080