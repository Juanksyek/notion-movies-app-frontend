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

# Comprobar que la carpeta dist se haya generado correctamente
RUN ls -la /app/dist

# Etapa de producción
FROM nginx:alpine

# Crear el directorio de configuración si no existe
RUN mkdir -p /etc/nginx/conf.d/

# Copiar la configuración de Nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Copiar los archivos compilados de Angular a la carpeta raíz de Nginx
COPY --from=build /app/dist/notion-movies-app-frontend /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
