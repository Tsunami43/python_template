FROM python:3.13-slim

# Set timezone
RUN apt-get update && apt-get install -y --no-install-recommends \
    tzdata \
 && ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
 && dpkg-reconfigure -f noninteractive tzdata \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY . .

# Установка uv и зависимостей из pyproject.toml
RUN pip install --no-cache-dir uv 
RUN uv pip install .
