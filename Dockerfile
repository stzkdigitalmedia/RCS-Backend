FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (using npm install instead of ci to avoid lockfile issues)
RUN npm install --omit=dev

# Copy the rest of the application code
COPY . .

# Expose API port
EXPOSE 3000

# Default command (can be overridden by docker-compose)
CMD ["node", "src/index.js"]
