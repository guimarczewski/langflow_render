FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Langflow
RUN pip install langflow

# Create langflow user and set permissions
RUN useradd -m -u 1001 langflow && \
    chown -R langflow:langflow /app

USER langflow

# Expose port
EXPOSE 10000

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:10000/health || exit 1

# Start Langflow
CMD ["python", "-m", "langflow", "run", "--host", "0.0.0.0", "--port", "10000"]
