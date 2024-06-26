# Use Amazon Linux 2 as the base image
FROM amazonlinux:2

# Update the package repository and install httpd (Apache)
RUN yum update -y && \
    yum install -y httpd && \
    yum clean all

# Copy custom HTML content to the default web directory
COPY ./index.html /var/www/html/

# Set the environment variables
ENV APACHE_RUN_USER=apache
ENV APACHE_RUN_GROUP=apache
ENV APACHE_LOG_DIR=/var/log/httpd

# Expose port 80
EXPOSE 80

# Start the Apache HTTP server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
