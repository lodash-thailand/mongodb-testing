FROM node:16-buster as base

# Installing "libcurl4" because some Debian images may not come with this package installed, but is required by the mongodb binaries
RUN apt-get install libcurl4

# Settings the CWD (Current Work Directory) to "/project" to have a isolated folder for the project
# Note: it is not recommended to set it to "/home/dockeruser", but to use "/home/dockeruser/project"
WORKDIR /project

# Copy the project (all files) into the image into "/project" as user "node:node"
# User "node:node" is the default nodejs user in the docker images
COPY . /project/

# Install all required dependencies locked to the package-lock (or yarn.lock)
# Replace "npm install" with your package manager command of choice
RUN npm install --ci

# Set the default command that will be used when running the image
# Replace this with your command / package manager command of choice
ENTRYPOINT ["npm", "run", "test"]

# FROM node:16-buster as base
# WORKDIR /app
# COPY ./package.json .
# RUN npm install
# COPY . .

# FROM base as test

# RUN npm run test

# CMD ["npm", "run", "start"]