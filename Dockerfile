FROM node:14

COPY ./ci-source .

# CMD ["node", "index.js", "echo", "33333"]
ENTRYPOINT ["/entrypoint.sh"]

# RUN node index.js

# docker build -t node-try .
# sudo docker run node-try
# sudo docker rm
# sudo docker rmi