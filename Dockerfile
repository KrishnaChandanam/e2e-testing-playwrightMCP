# Use official Node.js image as base
FROM node:18-bullseye

# Set working directory in container
WORKDIR /app

# Install system dependencies required by Playwright
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install Node dependencies
RUN npm ci

# Install Playwright browsers
RUN npx playwright install --with-deps

# Copy the entire project
COPY . .

# Run tests
CMD ["npm", "test"]
