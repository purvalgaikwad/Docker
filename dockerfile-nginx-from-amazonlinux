# Use the latest amazon linux 2 image as the base image
FROM amazonlinux:2

# Update the package repositories and install Nginx from Amazon Linux Extras
RUN yum update -y

RUN amazon-linux-extras install -y nginx1

# Set the working directory to the Nginx HTML directory
WORKDIR /usr/share/nginx/html

# Create an empty index.html file
RUN touch index.html

# Add content to the index.html file
RUN echo "HELLO FROM DOCKER" > index.html

# Expose port 80 for incoming HTTP traffic
EXPOSE 80

# Define the default command to run when a container is started
CMD ["nginx", "-g", "daemon off;"]
