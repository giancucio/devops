FROM python:3.12-slim

WORKDIR /app

COPY worker.py .

ENV SERVICE_NAME=worker
ENV ENVIRONMENT=dev
ENV VERSION=1.0.0
ENV INTERVAL_SECONDS=10

CMD ["python", "worker.py"]
