FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache wget

COPY package*.json ./
COPY tsconfig.json ./

RUN npm install
RUN npm install -g typescript

COPY . .

RUN tsc -b

EXPOSE 3000

CMD ["node", "dist/index.js"]
