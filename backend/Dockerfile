FROM node:22  
#from just allows to pull any base image that is published online on the docker official registry website
#juts like we have npm,pub.dev,there is also docker hub which is a registry for docker images
#which specifies all the base images that are available for us to use
#in this ,we are pulling the node image with version 22 from the docker hub
#this image contains the node.js runtime and npm package manager, which are required to run our backend express server
#we are using the node image because we are building a backend express server using node.js and npm

WORKDIR /app
#WORKDIR is a command that sets the working directory inside the container to /app

COPY . .
#COPY command copies files from the host machine to the container
#the first dot is the source directory on the host machine and the second dot is the destination directory inside the container
#in this case, we are copying all the files from the current directory on the host machine to the /app directory inside the container


RUN npm install
#RUN command is used to execute a command inside the container
#in this case, we are running npm install to install all the dependencies listed in the package.json file
#since we will be adding a dickerignore file to ignore the node_modules folder, we will not be copying the node_modules folder from the host machine to the container
#this is because we will be running npm install inside the container to install the dependencies


EXPOSE 8000
#EXPOSE command is used to expose a port inside the container to the host machine
#in this case, we are exposing port 8000 inside the container to the host machine
#this is the port that the backend express server will be running on
#we will be able to access the backend express server from the host machine using this port(localhost:8000)
CMD ["npm", "run", "dev"]
#CMD command is used to specify the command that will be run when the container is started
#in this case, we are running npm run dev to start the backend express server in development mode



#these all commands have seprate layers of their own
#so when we run the docker build command, it will create a new image with all these layers