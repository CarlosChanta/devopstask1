FROM python:2

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY api_task1.py ./

CMD [ "python", "./api_task1.py" ]