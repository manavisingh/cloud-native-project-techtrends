FROM python:3.8
LABEL maintainer="Manavi Singh"

EXPOSE 3111

WORKDIR usr/src/app

COPY ./techtrends/requirements.txt ./
RUN pip install -r requirements.txt

COPY ./techtrends ./

COPY ./techtrends/init_db.py ./
COPY ./techtrends/schema.sql ./
RUN python init_db.py

# command to run on container start
CMD [ "python", "app.py" ]