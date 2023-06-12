FROM node:current-alpine3.16 as build-stage

WORKDIR /app

COPY package*.json ./

COPY . .
RUN rm -rf ./nodes_modules
RUN rm -rf ./dist

RUN npm install yarn --legacy-peer-deps

RUN yarn install
RUN yarn run build-only


FROM arm64v8/nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY --from=build-stage /app/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /usr/share/nginx/html/assets/icons
RUN mkdir /usr/share/nginx/html/assets/experience
RUN mkdir /usr/share/nginx/html/assets/fonts
RUN mkdir /usr/share/nginx/html/assets/project
COPY --from=build-stage /app/src/assets/icons /usr/share/nginx/html/assets/icons
COPY --from=build-stage /app/src/assets/experience /usr/share/nginx/html/assets/experience
COPY --from=build-stage /app/src/assets/fonts /usr/share/nginx/html/assets/fonts
COPY --from=build-stage /app/src/assets/project /usr/share/nginx/html/assets/project

EXPOSE 80

CMD ["/bin/sh",  "-c",  "nginx -g 'daemon off;'"]