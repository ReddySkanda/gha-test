# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN apt-get update && apt-get install -y curl \
    && npm install

# Copy rest of the application
COPY . .

# Expose app port
EXPOSE 3000

# Run as root (hadolint will warn about missing USER)
CMD ["npm", "start"]
