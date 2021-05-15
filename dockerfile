FROM python:3
EXPOSE 4000
WORKDIR /app
COPY requirements.txt ./
COPY templates/home.html ./templates/
RUN pip install --no-cache-dir -r requirements.txt
COPY api_task1.py ./

CMD [ "python", "./api_task1.py" ]