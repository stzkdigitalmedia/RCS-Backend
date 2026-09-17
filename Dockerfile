FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Expose API port
EXPOSE 3000

# Default command (can be overridden by docker-compose)
CMD ["node", "src/index.js"]
