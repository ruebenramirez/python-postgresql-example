FROM python:3.8-slim-buster

RUN apt-get update && \
    apt-get install -y libpq-dev gcc python3-dev

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY db/* .
COPY query_data.py .

CMD ["python3", "query_data.py"]
