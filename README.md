<<<<<<< HEAD
# 🚀 ML Engineering Portfolio

Welcome to my **Machine Learning Engineering** portfolio. This repository documents
my journey from machine learning fundamentals to building production-ready AI
systems. It contains hands-on projects, experiments, and implementations covering
classical machine learning, deep learning, natural language processing, large
language models (LLMs), AI agents, Retrieval-Augmented Generation (RAG), and MLOps.

My goal is to develop practical AI solutions while following software engineering
best practices, including modular code, documentation, testing, and reproducible
experiments.

---

## 📚 Repository Structure

```text
ML-Engineering/
│
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

Each project contains its own documentation, source code, datasets (when permitted),
and implementation details.

---

## 🤖 Featured Projects

### Intelligent Troubleshooting Agent

An AI-powered troubleshooting assistant that combines semantic search with rule-based
reasoning to diagnose technical issues and recommend solutions.

**Key Features**

* Semantic similarity search using Sentence Transformers
* JSON-based knowledge base
* Interactive troubleshooting workflow
* Rule-based diagnostic engine
* Simulated automated repairs
* Easily extensible architecture

**Technologies**

* Python
* Sentence Transformers
* Hugging Face
* JSON
* Scikit-learn

---

### Large Language Model Projects

Projects exploring modern LLM development, including:

* Fine-tuning transformer models
* Prompt engineering
* Tokenization
* Text embeddings
* Retrieval-Augmented Generation (RAG)
* AI agent development

---

### Machine Learning Projects

Implementations of supervised and unsupervised learning algorithms including:

* Linear Regression
* Logistic Regression
* Decision Trees
* Random Forest
* Gradient Boosting
* XGBoost
* Clustering
* Principal Component Analysis (PCA)

---

### Deep Learning

Projects using modern deep learning frameworks:

* Neural Networks
* Convolutional Neural Networks (CNNs)
* Recurrent Neural Networks (RNNs)
* Long Short-Term Memory (LSTM)
* Transfer Learning

---

### Natural Language Processing

Projects involving:

* Text Classification
* Sentiment Analysis
* Document Embeddings
* Named Entity Recognition
* Question Answering

---

### Computer Vision

Projects including:

* Image Classification
* Object Detection
* Image Preprocessing
* Transfer Learning

---

### Azure AI & Machine Learning

---

## AG News Classifier

The current deployable project in this workspace is an AG News classifier called
Wire Desk. It fine-tunes a BERT-base encoder to classify newswire text into four
desks: World, Sports, Business, and Sci/Tech.

## Local run

```bash
cd backend
python3 -m venv .venv
source .venv/bin/activate        # Windows: .venv\Scripts\activate
pip install -r requirements.txt
uvicorn app:app --reload --port 8000
```

If you want both servers from one command, run:

```bash
./run.sh
```

The frontend can be opened directly from `frontend/index.html` or served with a
simple static server:

```bash
cd frontend
python3 -m http.server 5500
```

For GitHub Pages, the frontend also supports a demo mode when no backend URL is
configured. Set `?api=https://your-backend/predict` or `localStorage.AGNEWS_API_URL`
to point it at a live API.

## Notes

* `backend/requirements.txt` pins `transformers==4.39.3` to match the version the
  checkpoint was trained under.
* The local model artifacts are too large for a normal GitHub push, so they should
  stay out of a standard repo clone unless you intentionally publish them elsewhere.
* CORS is wide open (`allow_origins=["*"]`) for local development — tighten this
  before deploying `backend/app.py` anywhere public.
=======
 # 🚀 ML Engineering Portfolio

Welcome to my **Machine Learning Engineering** portfolio. This repository documents my journey from machine learning fundamentals to building production-ready AI systems. It contains hands-on projects, experiments, and implementations covering classical machine learning, deep learning, natural language processing, large language models (LLMs), AI agents, Retrieval-Augmented Generation (RAG), and MLOps.

My goal is to develop practical AI solutions while following software engineering best practices, including modular code, documentation, testing, and reproducible experiments.

---

## 📚 Repository Structure

```text
ML-Engineering/
│
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

Each project contains its own documentation, source code, datasets (when permitted), and implementation details.

---

## 🤖 Featured Projects

### Intelligent Troubleshooting Agent

An AI-powered troubleshooting assistant that combines semantic search with rule-based reasoning to diagnose technical issues and recommend solutions.

**Key Features**

* Semantic similarity search using Sentence Transformers
* JSON-based knowledge base
* Interactive troubleshooting workflow
* Rule-based diagnostic engine
* Simulated automated repairs
* Easily extensible architecture

**Technologies**

* Python
* Sentence Transformers
* Hugging Face
* JSON
* Scikit-learn

---

### Large Language Model Projects

Projects exploring modern LLM development, including:

* Fine-tuning transformer models
* Prompt engineering
* Tokenization
* Text embeddings
* Retrieval-Augmented Generation (RAG)
* AI agent development

---

### Machine Learning Projects

Implementations of supervised and unsupervised learning algorithms including:

* Linear Regression
* Logistic Regression
* Decision Trees
* Random Forest
* Gradient Boosting
* XGBoost
* Clustering
* Principal Component Analysis (PCA)

---

### Deep Learning

Projects using modern deep learning frameworks:

* Neural Networks
* Convolutional Neural Networks (CNNs)
* Recurrent Neural Networks (RNNs)
* Long Short-Term Memory (LSTM)
* Transfer Learning

---

### Natural Language Processing

Projects involving:

* Text Classification
* Sentiment Analysis
* Document Embeddings
* Named Entity Recognition
* Question Answering

---

### Computer Vision

Projects including:

* Image Classification
* Object Detection
* Image Preprocessing
* Transfer Learning

---

### Azure AI & Machine Learning

Cloud-based AI implementations using Microsoft Azure services, including:

* Azure Machine Learning
* Azure AI Services
* Model deployment
* Cloud-based inference
* AI workflows

---

## 🛠 Tech Stack

### Programming Languages

* Python
* SQL
* R

### Machine Learning

* Scikit-learn
* XGBoost
* TensorFlow
* Keras
* PyTorch

### NLP & LLMs

* Hugging Face Transformers
* Sentence Transformers
* Tokenizers
* LangChain
* FAISS
* ChromaDB

### Data Analysis

* Pandas
* NumPy
* Matplotlib
* Plotly

### Cloud & Tools

* Microsoft Azure
* Git
* GitHub
* Jupyter Notebook
* VS Code

---

## 🎯 Current Learning Focus

* AI Agents
* Retrieval-Augmented Generation (RAG)
* Large Language Models
* MLOps
* Model Deployment
* Production Machine Learning Systems
* Azure AI

---

## 📈 Goals

This repository serves as a record of my growth as an ML Engineer. My objectives include:

* Building production-quality AI applications
* Applying software engineering best practices to machine learning
* Exploring state-of-the-art AI technologies
* Developing scalable ML systems
* Creating projects that solve real-world problems

---

## 📬 Connect With Me

**GitHub:** https://github.com/MthabisiPatrice

**LinkedIn:** https://www.linkedin.com/in/mthabisimunyariri

---

⭐ Thank you for visiting my repository! Feedback, suggestions, and collaboration opportunities are always welcome.
>>>>>>> origin/main
