FROM python:3
EXPOSE 4000
WORKDIR /app
COPY requirements.txt ./
COPY src/templates/home.html ./templates/
RUN pip install --no-cache-dir -r requirements.txt
COPY src/app.py ./
CMD [ "python", "./app.py" ]