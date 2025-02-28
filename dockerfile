# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Install system dependencies, including ffmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of your application
COPY . .

# Expose the port used by your FastAPI server
EXPOSE 8080

# Start the FastAPI server
CMD ["uvicorn", "app.server:app", "--host=0.0.0.0", "--port=8080"]
