
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1


WORKDIR /app

RUN pip install --upgrade pip setuptools wheel

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    make \
    libffi-dev \
    musl-dev \
    libopenblas-dev \
    sqlite3 \
    libsqlite3-dev \
    libmagic-dev \
    tesseract-ocr \
    curl \
    git \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g prettier

COPY app /app

RUN pip install uv

EXPOSE 8000

CMD ["uv", "run", "main.py"]