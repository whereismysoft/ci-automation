FROM node:14-alpine

COPY ./ci-source .

# CMD ["node", "index.js", "echo", "33333"]
RUN ["./entrypoint.sh", "echo", "123"]

# docker build -t node-try .
# sudo docker run node-try
# sudo docker rm
# sudo docker rmi