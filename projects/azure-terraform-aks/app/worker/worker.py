import os
import socket
import time
from datetime import datetime, timezone

SERVICE_NAME = os.getenv("SERVICE_NAME", "worker")
ENVIRONMENT = os.getenv("ENVIRONMENT", "dev")
VERSION = os.getenv("VERSION", "1.0.0")
INTERVAL_SECONDS = int(os.getenv("INTERVAL_SECONDS", "10"))
HOSTNAME = socket.gethostname()


def log(message: str) -> None:
    timestamp = datetime.now(timezone.utc).isoformat()
    print(
        f"[{timestamp}] "
        f"service={SERVICE_NAME} "
        f"environment={ENVIRONMENT} "
        f"version={VERSION} "
        f"hostname={HOSTNAME} "
        f"message={message}",
        flush=True
    )


def main() -> None:
    log("Worker started")
    counter = 0

    while True:
        counter += 1
        log(f"Processing background job #{counter}")
        time.sleep(INTERVAL_SECONDS)


if __name__ == "__main__":
    main()
