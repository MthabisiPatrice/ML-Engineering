# AG News Classifier — Wire Desk

A BERT-base model fine-tuned on AG News (World / Sports / Business / Sci-Tech),
served locally through a small API, with a standalone browser UI on top.

## Folder structure

```
agnews-classifier/
├── model/              fine-tuned checkpoint (safetensors + tokenizer files)
├── backend/             FastAPI server that loads the checkpoint and serves /predict
├── frontend/            index.html — static UI, no build step, talks to the backend
├── notebooks/           the training notebook
├── data/                ag_news_dataset.csv used for fine-tuning
└── README.md
```

Duplicate files from your original upload (`config_2.json`, `special_tokens_map_2.json`,
`tokenizer_config_2.json`, and the second copy of the notebook) were byte-identical to
the originals, so only one copy of each is kept here.

One fix worth noting: `model/config.json` originally had generic `LABEL_0..LABEL_3`
names. I relabeled them to `World / Sports / Business / Sci-Tech` (id 0–3), based on
the standard AG News ordering and cross-checked against `label=2` rows in your CSV,
which are business articles — confirms the mapping.

## 1. Set up the backend

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

First run will take a minute while it loads the ~438MB checkpoint. Once you see
`Model loaded on cpu/cuda`, it's ready. Test it:

```bash
curl -X POST http://localhost:8000/predict \
  -H "Content-Type: application/json" \
  -d '{"text": "The central bank raised interest rates by half a point."}'
```

## 2. Open the frontend

No build step needed — just open `frontend/index.html` directly in a browser,
or serve it so relative paths behave the same as a real deploy:

```bash
cd frontend
python3 -m http.server 5500
# then visit http://localhost:5500
```

The page calls `http://localhost:8000/predict`. Keep the backend running in
another terminal while you use it.

## 3. Showcasing it (no local server required)

For a portfolio link that works on GitHub Pages, the frontend now supports a
demo classifier when no backend URL is configured. Publish the `frontend/`
folder with GitHub Pages, and use the `?api=https://your-backend/predict`
query string or `localStorage.AGNEWS_API_URL` if you later host the FastAPI
service somewhere public.

If you want the real checkpoint online as well, the model itself is too large
for a normal GitHub push, so it should live in object storage or a model host
such as Hugging Face Spaces, while GitHub Pages serves the UI.

## Notes

- `backend/requirements.txt` pins `transformers==4.39.3` to match the version
  the checkpoint was trained under (per `model/config.json`).
- CORS is wide open (`allow_origins=["*"]`) for local development — tighten
  this before deploying `backend/app.py` anywhere public.
