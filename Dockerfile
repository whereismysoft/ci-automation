FROM node:14-alpine

COPY . .

RUN ["echo", "HI FROM DOCKER IMAGE! $TICKET_URL"]

# COPY ./ci-source .

# CMD ["node", "index.js"]
# RUN ["./entrypoint.sh"]

# docker build -t node-try .
# sudo docker run node-try
# sudo docker rm
# sudo docker rmi