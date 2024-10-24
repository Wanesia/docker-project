# Step 1: Build Stage
FROM node:20.18.0 AS build
WORKDIR /app

# Copy only package files for dependency installation
COPY package.json package-lock.json ./
RUN npm ci --only=production

# Copy the rest of the application code
COPY . .

# Step 2: Production Stage
FROM node:20.18.0-slim
WORKDIR /app

# Create a non-root user for security
RUN useradd -m appuser

# Copy app from the build stage
COPY --from=build /app .

# Ensure appuser owns all the files
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

# Expose the app's port
EXPOSE 3000

# Command to run the app
CMD ["node", "server.js"]