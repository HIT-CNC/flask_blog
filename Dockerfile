FROM python:3.7-alpine

RUN mkdir /app

WORKDIR /app

COPY requirements.txt /app

COPY . /app

RUN pip3 install -r requirements.txt

RUN mkdir /data

ENV prometheus_multiproc_dir /tmp
ENV METRICS_PORT 9200
#ENTRYPOINT ["python", "app.py"]
CMD ["gunicorn","-c","config.py", "-w 4", "-b", "0.0.0.0:8000", "server:app"]
