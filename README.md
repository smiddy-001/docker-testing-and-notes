# Docker
docker is about making the os and dependancies forced / autodownload and deployable.
Useful for severs and such things, like a vm but significantly faster.

**For Example**
say you make a website using node, with 6 different api's and you decided to let your
 friend who is using linux help out with your project. They will need the exact same 
 software and dependancies installed plus the possible hardware differeneces

### Docker Info / Dependancies
Install Docker at https://docs.docker.com/get-docker/
If possible install the docker desktop app at https://www.docker.com/products/docker-desktop/
Install The Docker vsc extension / vim package / you get the idea 



## Dockerfile
Is located in the root of the project

```dockerfile
# The enviroment. This can be anything I just chose node as
# it includes the nessecary dependancies to run the index.js app.
FROM node:12

# Defines the working directory
WORKDIR /app

# the * character is a wildcard that matches any characters. 
# So, package*.json matches all files that start with the 
# characters "package" and end with the extension ".json", 
# regardless of the characters in between. For example, it 
# would match files named "package.json", "package-lock.json",
# and "package-test.json".

# we use the ./ to explicitly confirm where the package file 
# is from. Some apps may have multiple apps embedded within 
# themsevels and having its location explicitly deficned provides
# absolute certainty
COPY package*.json ./

# Install node dependancies / bash command
RUN npm install

# Copy simply tells docker To copy . to . (this whole project
# starting at the root to that whole project starting at root)
COPY . .

# Changes the port enviroment variable
ENV PORT=8080

# Expose simply exposes the port so your app can use that port
EXPOSE 8080

# CMD is the command, commands can only be run once per
# dockerfile and the format isn't like how a bash script
# would look like
CMD [ "npm", "start" ] 

# now you would open a terminal in the same directory as
# the docerfile and run the following

# docker build -t NAME/APP:MAJORVERSION.MINORVERSION DIRECTORY
# docker build -t riley/demoapp:1.0 .
```

## Image
Is the project including the dockerfile

## Container
Is the docker enviroment ak contained operating system