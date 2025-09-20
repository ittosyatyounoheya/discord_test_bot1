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

# Python依存関係をコピーしてインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションコードをコピー
COPY . .

# Webサーバー用ポート
EXPOSE 10000

# Bot + Webを同時起動するメインスクリプト
CMD ["python", "startup.py"]
