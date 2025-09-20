import threading
from main import run_bot
from website import run_web

if __name__ == "__main__":
    # Botをスレッドで起動
    threading.Thread(target=run_bot).start()
    # Webサーバーをメインスレッドで起動
    run_web()
