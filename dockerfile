FROM node:11.15.0-alphine as build-step
#RUN mkdir -p /usr/src/app
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 4200
CMD ["npm", "start"]


# FROM node:11.15.0-alphine as build-step
# WORKDIR /app
# COPY package.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx:1.16.0-alphine as deploy-step
# COPY --from=build-step /app/dist/ng-template-docker /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]