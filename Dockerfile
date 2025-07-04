FROM python:3.10-slim-bookworm AS builder
WORKDIR /app
COPY app.py .

# Stage 2: Use Google's distroless image
FROM gcr.io/distroless/python3
WORKDIR /app
COPY --from=builder /app /app
CMD ["app.py"]