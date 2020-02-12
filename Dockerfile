FROM node:10.19-alpine

ARG PORT=3000

# Create app directory
WORKDIR /usr/src/app
COPY package*.json ./

RUN yarn
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

RUN yarn build

EXPOSE ${PORT}
CMD [ "yarn", "start" ]