# Step 1: Build stage
FROM node:22-alpine AS builder

WORKDIR /app

# 종속성 설치
COPY package*.json ./
RUN npm install

# 소스 복사 후 빌드
COPY . .
RUN npm run build

# Step 2: Run stage (경량 이미지)
FROM node:22-alpine AS runner

ENV NODE_ENV=production
WORKDIR /app

# 빌드된 결과물만 복사
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/next.config.ts ./next.config.ts
COPY --from=builder /app/lib/config.ts ./lib/config.ts

EXPOSE 3000
CMD ["npm", "start"]
