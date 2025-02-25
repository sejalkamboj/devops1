from fastapi import FastAPI
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"name": "Sejal", "Location": "Saharanpur"}

@app.get("/{data}")
def read_data(data: str):
    return {"hi": data, "Location": "Saharanpur"}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=80)
