FROM node:10-alpine3.9 as builder
# FROM node:12 as builder
WORKDIR /code
COPY . .

# RUN npm install --registry=https://registry.npm.taobao.org && npm run build:prod
# RUN npm install --registry=https://registry.cnpmjs.org && npm run build:prod

RUN npm install node-sass --sass_binary_site=https://npm.taobao.org/mirrors/node-sass
RUN npm install --registry=https://registry.npmjs.org && npm run build:prod

FROM nginx:1.19.2-alpine
COPY --from=builder /code/dist /usr/share/nginx/html
