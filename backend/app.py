"""
AG News BERT classifier — local inference server.

Loads the fine-tuned checkpoint from ../model and exposes a single
POST /predict endpoint that the frontend (frontend/index.html) calls.

Run:
    pip install -r requirements.txt
    uvicorn app:app --reload --port 8000
"""

from pathlib import Path

import torch
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from transformers import AutoTokenizer, BertForSequenceClassification

MODEL_DIR = Path(__file__).resolve().parent.parent / "model"

app = FastAPI(title="AG News Classifier API")

# Allow the local static frontend (opened via file:// or a simple http.server)
# to call this API from the browser.
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

print(f"Loading model from {MODEL_DIR} ...")
tokenizer = AutoTokenizer.from_pretrained(MODEL_DIR)
model = BertForSequenceClassification.from_pretrained(MODEL_DIR)
model.eval()

device = "cuda" if torch.cuda.is_available() else "cpu"
model.to(device)
print(f"Model loaded on {device}. Labels: {model.config.id2label}")


class PredictRequest(BaseModel):
    text: str


class PredictResponse(BaseModel):
    category: str
    scores: dict[str, float]


@app.get("/health")
def health():
    return {"status": "ok", "device": device}


@app.post("/predict", response_model=PredictResponse)
def predict(req: PredictRequest):
    inputs = tokenizer(
        req.text,
        return_tensors="pt",
        truncation=True,
        padding="max_length",
        max_length=128,
    ).to(device)

    with torch.no_grad():
        logits = model(**inputs).logits
        probs = torch.softmax(logits, dim=-1).squeeze().tolist()

    id2label = model.config.id2label
    scores = {id2label[i]: round(float(p), 4) for i, p in enumerate(probs)}
    category = max(scores, key=scores.get)

    return PredictResponse(category=category, scores=scores)
