# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Install system dependencies including curl, ffmpeg, and build-essential
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ffmpeg \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Rust (using rustup) so that packages requiring Rust (like tiktoken) can be built.
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add the Rust binaries to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

# Set working directory
WORKDIR /app

# Copy requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port that your app runs on
EXPOSE 8000

# Start the FastAPI server using uvicorn
CMD ["uvicorn", "app.server:app", "--host", "0.0.0.0", "--port", "8000"]
