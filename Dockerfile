# Stage 1: Build the Next.js application
FROM node:22 AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

RUN npm ci

COPY . .

EXPOSE 3000

RUN npm run build

# Stage 2: Production image
FROM node:22 AS runner

WORKDIR /app

ENV NODE_ENV=production

ENV PORT=3000

COPY --from=builder /app/.next ./.next

COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app/public ./public

COPY package.json ./package.json

EXPOSE 3000

CMD ["npm", "start"]