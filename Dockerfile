# ベースイメージ
FROM python:3.11-slim

# 作業ディレクトリ
WORKDIR /app

# システム依存パッケージのインストール（音声再生用）
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        build-essential \
        libffi-dev \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev



# Python依存関係をコピーしてインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションコードをコピー
COPY . .

# Webサーバー用ポート
EXPOSE 10000

# Bot + Webを同時起動するメインスクリプト
CMD ["python", "startup.py"]
