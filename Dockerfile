# Use Node.js 16 Alpine image as base
FROM node:18-alpine as Test

# Set the working directory within the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json yarn*.lock ./

# Install dependencies
RUN yarn

# Copy the rest of the application files to the working directory
COPY . .

# Build the React application
RUN yarn build

# # Expose port 5000 for the application
EXPOSE 3000

# Command to run the application when the container starts
CMD ["yarn", "start"]

# Build 2
FROM test as build