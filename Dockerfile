FROM node:latest AS build
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:latest AS runtime
WORKDIR /usr/src/app

COPY --from=build /usr/src/app .

EXPOSE 3000

CMD ["node", "app.js"]

