from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def health():
    return {"status": "running"}

def run_web():
    uvicorn.run(app, host="0.0.0.0", port=10000)
