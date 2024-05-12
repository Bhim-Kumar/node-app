# Build Stage
FROM node:14-alpine AS builder

LABEL description="This is a multi-stage NodeJS image"

WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Runtime Stage
FROM node:14-alpine

WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "server.js"]
