# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Install system dependencies, including ffmpeg
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    build-essential && \
    rm -rf /var/lib/apt/lists/*

# (Optional) Verify ffmpeg is installed by printing its location
RUN which ffmpeg

# Set working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port (Railway typically uses 8080)
EXPOSE 8080

# Start the FastAPI server using uvicorn
CMD ["uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "8080"]
