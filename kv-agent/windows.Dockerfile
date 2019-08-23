FROM python:3.7-windowsservercore-1809

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app/ ./

CMD ["python", "./main.py"]
