import threading
from main import run_bot
from website import run_web

if __name__ == "__main__":
    # Bot���X���b�h�ŋN��
    threading.Thread(target=run_bot).start()
    # Web�T�[�o�[�����C���X���b�h�ŋN��
    run_web()
