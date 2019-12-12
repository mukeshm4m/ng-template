FROM node:12.13.1-alpine3.10 as build-step
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build --prod

EXPOSE 8090

FROM nginx:1.17.6-alpine as deploy-step
COPY --from=build-step /app/dist/ng-template /usr/share/nginx/html