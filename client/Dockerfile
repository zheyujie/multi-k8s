FROM node:14.14.0-alpine as builder
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm runbuild

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nigx/conf.d/defalt.conf
COPY --from=builder /app/build /usr/share/nginx/html
