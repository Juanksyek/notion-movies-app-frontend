# Etapa de compilación
FROM node:latest as build

WORKDIR /app

# Instalar Angular CLI globalmente
RUN npm install -g @angular/cli

COPY package*.json ./

RUN npm install

COPY . .

# Compilar la aplicación en modo de producción
RUN ng build --configuration=production

# Etapa de producción
FROM nginx:latest

COPY --from=build /app/dist/notion-movies-app-frontend /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
