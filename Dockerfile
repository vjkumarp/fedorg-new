# Stage 1: Build
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./

# Install dependencies (include dev for build tools like vite/typescript)
RUN npm ci --include=dev

# Copy rest of the project
COPY . .

# Build the app
RUN npm run build

# Stage 2: Production
FROM node:20-alpine AS runner

WORKDIR /app

# Copy only necessary files from builder
COPY --from=builder /app/package*.json ./
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules

# Expose port (Next.js defaults to 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
