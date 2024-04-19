FROM python:3.9.19
EXPOSE 8000
WORKDIR /app
COPY requirements.txt /app
RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./backend/my_garderob /app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]