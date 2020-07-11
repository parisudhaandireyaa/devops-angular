FROM node:12.18.2-alpine AS builder
COPY . ./new-app
WORKDIR /new-app
RUN npm i -g @angular/cli@latest
RUN $(npm bin)/ng build --prod

FROM nginx:1.15.8-alpine
COPY --from=builder /new-app/dist/new-app/ /usr/share/nginx/html
