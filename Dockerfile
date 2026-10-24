
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY tsconfig.json ./
COPY src ./src
RUN npm run build

FROM nginx:alpine

COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css
COPY --from=build /app/dist/main.js /usr/share/nginx/html/main.js
COPY src/app.js /usr/share/nginx/html/app.js

EXPOSE 80
