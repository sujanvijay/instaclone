FROM python:3.11-slim

WORKDIR /app

# Install build dependencies for greenlet and other C extensions
RUN apt-get update && \
    apt-get install -y build-essential gcc libffi-dev python3-dev && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . .

CMD ["python", "app.py"]
