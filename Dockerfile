FROM arm64v8/node:current-alpine3.16 as build-stage

WORKDIR /app

COPY package*.json ./

COPY . .
RUN rm -rf ./nodes_modules
RUN rm -rf ./dist

RUN npm install yarn --legacy-peer-deps

RUN yarn install
RUN yarn run build-only


FROM nginx:stable-alpine as production-stage

COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY --from=build-stage /app/nginx.conf /etc/nginx/nginx.conf
# RUN mkdir /usr/share/nginx/html/assets
COPY --from=build-stage /app/src/assets /usr/share/nginx/html/assets

EXPOSE 80

CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/index.html > /usr/share/nginx/html/temp && cat /usr/share/nginx/html/temp > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"]