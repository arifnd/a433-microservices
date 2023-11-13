# Use the Node.js 14.21 Alpine image as the base image
FROM node:14.21-alpine as builder

# Set the working directory in the container to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install Node.js application dependencies
RUN npm install

# Copy the rest of the application source code to the container
COPY . .

# Expose port 3001 for the Node.js application to listen on
EXPOSE 3001

# Define the command to start the Node.js application
CMD [ "npm", "run", "start" ]
