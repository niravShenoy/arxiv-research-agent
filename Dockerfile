FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim AS builder

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-install-isolated

FROM python:3.12-slim AS runtime
WORKDIR /app
COPY --from=builder /app/.venv ./venv
ENV PATH="/app/venv/bin:$PATH"
COPY . .
EXPOSE 8000
CMD ["uv", "run", "python", "src/main.py"]