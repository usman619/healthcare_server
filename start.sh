#!/bin/bash
# Install ffmpeg
apt-get update && apt-get install -y ffmpeg

# Set the FFMPEG_BINARY environment variable for pydub
export FFMPEG_BINARY=/usr/bin/ffmpeg

# (Optional) You can echo the value to verify:
echo "FFMPEG_BINARY is set to $FFMPEG_BINARY"

# Install Python dependencies
pip install --no-cache-dir -r requirements.txt

# Start the FastAPI server
uvicorn app.server:app --host=0.0.0.0 --port=8080
