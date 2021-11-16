FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/guswl4399/pragmatic1.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN echo "SECRET_KEY=django-insecure-l_2_%suou4771r+q@v*)38l(n!ih+r#=1qldp936mf%^18o^pw" > .env

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]

