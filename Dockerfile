FROM python:3.9.0

WORKDIR /home/

RUN echo "test"

RUN git clone https://github.com/guswl4399/pragmatic4.git

WORKDIR /home/pragmatic4/

RUN pip install -r requirements3.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=pragmatic.settings.deploy && python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy  --bind 0.0.0.0:8000"]
