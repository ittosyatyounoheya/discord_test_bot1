# �x�[�X�C���[�W
FROM python:3.11-slim

# ��ƃf�B���N�g��
WORKDIR /app

# �V�X�e���ˑ��p�b�P�[�W�̃C���X�g�[���i�����Đ��p�j
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
    libxslt1-dev


# Python�ˑ��֌W���R�s�[���ăC���X�g�[��
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# �A�v���P�[�V�����R�[�h���R�s�[
COPY . .

# Web�T�[�o�[�p�|�[�g
EXPOSE 10000

# Bot + Web�𓯎��N�����郁�C���X�N���v�g
CMD ["python", "startup.py"]
