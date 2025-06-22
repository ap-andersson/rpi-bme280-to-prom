FROM python:3.13.5-bookworm

RUN apt update && apt install -y \
    python3-dev \
    gcc

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

WORKDIR /app

RUN pip install --no-cache-dir \
    requests \
    gpiozero \
    prometheus_client \
    requests \
    smbus2 \
    RPi.bme280 \
    RPi.GPIO

COPY main.py .

EXPOSE 8000

CMD ["python3", "-u", "main.py"]
