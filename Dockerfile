## Stage 1: Build dependencies
FROM python:3.9-slim AS builder

# Set environment variables for build
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on

WORKDIR /build

# Install build dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python dependencies into the virtual environment
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

## Stage 2: Runtime
FROM python:3.9-slim AS runtime

# Set environment variables for runtime
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Copy the virtual environment from the builder stage
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy application code
COPY . .

# Create non-root user for better security
RUN groupadd -r appuser && useradd -r -g appuser appuser && \
    chown -R appuser:appuser /app

# Clean up any unnecessary files
RUN find /app -type d -name __pycache__ -exec rm -rf {} +

# Switch to non-root user
USER appuser

# Expose the port
EXPOSE 5000

# Set the entrypoint with optimized Gunicorn settings
CMD ["gunicorn", "--workers=4", "--threads=2", "--worker-class=gthread", "--bind=0.0.0.0:5000", "--max-requests=1000", "--max-requests-jitter=50", "run:app"]
