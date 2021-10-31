FROM node:14

COPY ./ci-source .

RUN echo "Hi from docker"

# RUN node index.js