# Use the Node.js 14.21 Alpine image as the base image
FROM node:14.21-alpine as builder

# Install bash
RUN apk add --no-cache bash

# download wait-for-it.sh
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Make wait-for-it.sh executable
RUN chmod +x /bin/wait-for-it.sh

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js application dependencies
RUN npm install

# Copy the rest of the application source code to the container
COPY . .

# Expose port 3000 for the Node.js application to listen on
EXPOSE 3000

# Define the command to start the Node.js application
CMD [ "node", "index.js" ]
