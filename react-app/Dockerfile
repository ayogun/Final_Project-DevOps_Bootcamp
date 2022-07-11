# pull official base image
FROM node:slim

# set working directory
WORKDIR /my-app

# add `/app/node_modules/.bin` to $PATH
ENV PATH="./node_modules/.bin:$PATH"

# add app
COPY . .

RUN npm run build

# start app
CMD ["npm", "start"]
