FROM node

COPY ./ci-source .

RUN node index.js