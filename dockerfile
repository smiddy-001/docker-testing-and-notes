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