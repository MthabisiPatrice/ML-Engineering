# 🚀 ML Engineering Portfolio

Welcome to my Machine Learning Engineering portfolio. This repository documents work across machine learning, deep learning, natural language processing, large language models, AI agents, RAG, and MLOps.

## Repository Structure

```text
ML-Engineering/
├── AI-Agents/
├── Azure-AI/
├── Computer-Vision/
├── Deep-Learning/
├── Intelligent-Troubleshooting-Agent/
├── LLM-Fine-Tuning/
├── Machine-Learning/
├── MLOps/
├── NLP/
├── RAG/
├── Time-Series/
└── README.md
```

## Featured Work

### Intelligent Troubleshooting Agent

An AI-powered troubleshooting assistant that combines semantic search with rule-based reasoning to diagnose technical issues and recommend solutions.

### Large Language Model Projects

Projects exploring fine-tuning, prompt engineering, tokenization, embeddings, RAG, and agent development.

### Machine Learning Projects

Implementations of regression, classification, clustering, and PCA.

### Deep Learning

Projects using neural networks, CNNs, RNNs, LSTMs, and transfer learning.

### Natural Language Processing

Projects involving text classification, sentiment analysis, embeddings, named entity recognition, and question answering.

### Computer Vision

Projects including image classification, object detection, preprocessing, and transfer learning.

### Azure AI & Machine Learning

Cloud-based AI implementations using Microsoft Azure services.

## AG News Classifier

The deployable app in this workspace is an AG News classifier called Wire Desk. It fine-tunes a BERT-base encoder to classify newswire text into World, Sports, Business, and Sci/Tech.

## Local Run

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\\Scripts\\activate
pip install -r requirements.txt
uvicorn app:app --reload --port 8000
```

To run both servers together:

```bash
./run.sh
```

Open `frontend/index.html` directly or serve the folder with a static server:

```bash
cd frontend
python3 -m http.server 5500
```

For GitHub Pages, the frontend supports a demo mode when no backend URL is configured. Set `?api=https://your-backend/predict` or `localStorage.AGNEWS_API_URL` to point it at a live API.

## Notes

* `backend/requirements.txt` pins `transformers==4.39.3` to match the training environment.
* Large local model artifacts should stay out of a normal GitHub push unless you intentionally publish them elsewhere.
* CORS is wide open (`allow_origins=["*"]`) for local development and should be tightened before public deployment.
