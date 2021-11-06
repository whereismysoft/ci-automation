FROM node:14-alpine

ARG RELEASE_VERSION

COPY . .

RUN echo "HI FROM DOCKER IMAGE! $RELEASE_VERSION"

# COPY ./ci-source .

# CMD ["node", "index.js"]
# RUN ["./entrypoint.sh"]

# docker build -t node-try .
# sudo docker run node-try
# sudo docker rm
# sudo docker rmi