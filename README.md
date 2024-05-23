## Evaluación de unidad .

Proyecto realizado por: **Daniel Alfredo Collaguazo Malla**

# Proyecto frontend en repositorio aparte por fallos en la misma subida: https://github.com/DanielCollaguazo2003/Proyecto_docker

### Como construir y levantar la imagen.
**Construir la aplicación:** docker build -t danielcollaguazo/prueba_docker_collaguazo2

**Levantar la imagen:** docker run -d -p 80:80 --name danielcollaguazo/prueba_docker_collaguazo2

### Uso de la aplicación
- **Iniciar la aplicación angular**
La aplicación se debe iniciar en el puerto 80 (**localhost:80**) , la aplicacion mostrara la frase solicitada


## Archivo dockerfile
FROM node:latest AS build
WORKDIR /app/home

COPY prueba_docker_CollaguazoDaniel/ /app/home

RUN npm install --force
RUN npm run build --prod

#FROM ubuntu:latest
#RUN apt-get -y update && apt-get -y install nginx
FROM nginx:1.17.1-alpine
COPY --from=build /app/home/dist/prueba-docker-collaguazo-daniel /usr/share/nginx/html

 CMD ["sh", "-c", "nginx -g 'daemon off;'"]

EXPOSE 80
