# Use Node.js 16 Alpine image as base
FROM node:18-alpine as Deps

FROM deps as Build 

WORKDIR /app

COPY package*.json yarn*.lock ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm","start"]