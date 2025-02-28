#!/bin/bash
# Install ffmpeg
apt-get update && apt-get install -y ffmpeg

# Add /usr/bin to PATH
echo 'export PATH="/usr/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# Install python dependencies
pip install --no-cache-dir -r requirements.txt

# Start the server
uvicorn app.server:app --host=0.0.0.0 --port=8080