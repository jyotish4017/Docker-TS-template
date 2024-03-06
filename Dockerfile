# multi-stage container: first build to get JS file then copy & run in second stage.
FROM node:16-alpine as development
WORKDIR /usr/src/app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM node:16-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app
COPY package*.json .

#ignore dev dependencies
RUN npm ci --only=production 

#now will have only js file, not TS
COPY --from=development /usr/src/app/dist ./dist

CMD [ "node", "dist/index.js" ]