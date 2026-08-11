from flask import Flask, jsonify, request
import logging
import os
import random
import socket
from datetime import datetime, timezone

from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

app = Flask(__name__)

SERVICE_NAME = os.getenv("SERVICE_NAME", "api")
ENVIRONMENT = os.getenv("ENVIRONMENT", "dev")
VERSION = os.getenv("VERSION", "1.0.0")
HOSTNAME = socket.gethostname()
APPINSIGHTS_CONNECTION_STRING = os.getenv("APPLICATIONINSIGHTS_CONNECTION_STRING")

if APPINSIGHTS_CONNECTION_STRING:
    configure_azure_monitor(
        connection_string=APPINSIGHTS_CONNECTION_STRING,
        enable_live_metrics=True,
    )

logger = logging.getLogger("api")
logger.setLevel(logging.INFO)
tracer = trace.get_tracer(__name__)


@app.route("/health", methods=["GET"])
def health():
    logger.info("health endpoint called")
    return jsonify({
        "status": "ok",
        "service": SERVICE_NAME,
        "environment": ENVIRONMENT,
        "version": VERSION,
        "hostname": HOSTNAME,
        "timestamp": datetime.now(timezone.utc).isoformat()
    }), 200


@app.route("/message", methods=["GET"])
def message():
    with tracer.start_as_current_span("custom_message_operation") as span:
        user_agent = request.headers.get("User-Agent", "unknown")
        span.set_attribute("app.environment", ENVIRONMENT)
        span.set_attribute("app.version", VERSION)
        span.set_attribute("http.user_agent", user_agent)

        logger.info("message endpoint called from user_agent=%s", user_agent)

        return jsonify({
            "message": "Hello from the API service",
            "service": SERVICE_NAME,
            "environment": ENVIRONMENT,
            "version": VERSION,
            "hostname": HOSTNAME,
            "timestamp": datetime.now(timezone.utc).isoformat()
        }), 200


@app.route("/demo-error", methods=["GET"])
def demo_error():
    logger.warning("demo-error endpoint called")
    if random.randint(1, 2) == 1:
        raise RuntimeError("Simulated failure for Application Insights demo")

    return jsonify({"status": "no error this time"}), 200


@app.route("/", methods=["GET"])
def root():
    logger.info("root endpoint called")
    return jsonify({
        "service": SERVICE_NAME,
        "message": "API is running. Try /health, /message, or /demo-error"
    }), 200
