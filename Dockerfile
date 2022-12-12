# use nodejs 14 base image
FROM node:14-alpine

# set /app as working directory
WORKDIR /app

# copy source to container
COPY . .

# set nodejs env in production and use item-db as database host
ENV NODE_ENV=production DB_HOST=item-db

# install depedencies and build from source
RUN npm install --production --unsafe-perm && npm run build

# run service
CMD ["npm", "start"]

# open port 8080
EXPOSE 8080