
WORKDIR /app

#Python won’t try to write .pyc files on the import of source modules
ENV PYTHONDONTWRITEBYTECODE 1
#Force the stdout and stderr streams to be unbuffered
ENV PYTHONUNBUFFERED 1

RUN python3 -m pip install --upgrade pip

COPY requirements.txt /app

RUN python3 -m pip install -r requirements.txt

COPY . /app

EXPOSE 8000

CMD [ "python", "manage.py" , "runserver", "0.0.0.0:8000"]
