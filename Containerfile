# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
# Containerfile — rhodium-pipeline
#
# Build: podman build -t rhodium-pipeline -f Containerfile .
# Run:   podman run -it --rm -v $(pwd):/workspace rhodium-pipeline

FROM docker.io/library/rust:1.75-slim-bookworm AS base

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install just (task runner)
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# Install cargo-generate
RUN cargo install cargo-generate --locked

# Create non-root user for security
RUN useradd -m -s /bin/bash developer
USER developer
WORKDIR /home/developer

# Copy template files
COPY --chown=developer:developer . /home/developer/rhodium-pipeline

WORKDIR /home/developer/rhodium-pipeline

# Default command
CMD ["just", "--list"]

# Labels for OCI compliance
LABEL org.opencontainers.image.title="Rhodium Pipeline Template"
LABEL org.opencontainers.image.description="Methodology template for formally-verified data processing pipelines"
LABEL org.opencontainers.image.url="https://github.com/hyperpolymath/rhodium-pipeline"
LABEL org.opencontainers.image.source="https://github.com/hyperpolymath/rhodium-pipeline"
LABEL org.opencontainers.image.version="0.1.0"
LABEL org.opencontainers.image.licenses="AGPL-3.0-or-later"
LABEL org.opencontainers.image.vendor="Hyperpolymath"
