FROM node:latest AS build
WORKDIR /app/home

COPY prueba_docker_CollaguazoDaniel/ /app/home

RUN npm install --force
RUN npm run build --prod

# FROM ubuntu:latest
# RUN apt-get -y update && apt-get -y install nginx
FROM nginx:1.17.1-alpine

#COPY --from=build /app/home/dist/prueba-docker-collaguazo-daniel  /var/www/abdhesh/tech/

COPY --from=build /app/home/dist/prueba-docker-collaguazo-daniel /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80   