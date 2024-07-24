# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.11-slim

# Copy local code to the container image.
# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./

# Install git for detectron2 installation and for convert_from_path
RUN apt-get update && \
   apt-get install -y git poppler-utils g++ && \
   apt-get clean && \
   rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

# Install detectron dependencies.
COPY requirements.txt ./
RUN pip install -r requirements.txt

# for detectron2 
RUN python -m pip install git+https://github.com/facebookresearch/detectron2.git@v0.5