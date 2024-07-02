# Usar una versión más reciente de Node.js
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build --prod

# Configurar el servidor web Nginx
FROM nginx:alpine
COPY --from=builder /app/dist/notion-movies-app-frontend /usr/share/nginx/html
