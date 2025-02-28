# Healthcare Server
FastAPI server for Healthcare Translation Web App.

## Tech Stack 🛠️

- **Backend Framework**: FastAPI
- **AI Services**: 
  - Google Speech Recognition
  - Google Gemini AI
- **Audio Processing**: pydub
- **Environment**: Python 3.8+
- **Deployment Platform**: (railway.com)[https://railway.com/]

## Project Structure 📁

```
healthcare_server/
│   ├── routes/
│   ├── transcribe.py      # Audio transcription endpoint
│   └── translate.py       # Translation endpoint
└── server.py              # Main server configuration
```

## API Endpoints 🔌

### Transcription

```http
POST /transcribe/
```

- Accepts WAV/MP3 audio files
- Returns original and corrected transcripts
- Handles medical terminology validation

### Translation

```http
POST /translate/
```
- Accepts source language, target language, and text to be translated
- Returns the translated text

## Setup & Installation 💻

1. Clone the repository:
```bash
git clone https://github.com/usman619/healthcare_server
cd healthcare_server
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

3. Install ffmpeg in conda or on your device
```bash
conda install -c conda-forge ffmpeg
```
```bash
sudo apt-get update
sudo apt-get install ffmpeg
```

4. Configure environment variables:
```bash
cp .env.example .env
# Edit .env with your API keys
```

5. Start the server:
```bash
cd server
fastapi dev server.py
```

## Environment Variables 🔐

Required environment variables in `.env`:
- `GEMINI_API_KEY`: Google Gemini AI API key

## API Documentation 📚

Access the interactive API documentation:
- Swagger UI: `http://localhost:8000/docs`
- ReDoc: `http://localhost:8000/redoc`