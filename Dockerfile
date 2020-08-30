# Specify the node base image
FROM mongo:4.2

# Maintainer
LABEL maintainer="jstagg@gmail.com"

# Install app dependencies
COPY aliases.csv ./
COPY load.sh ./

# Ready the container
RUN apt update && apt install -y dos2unix && apt clean
RUN dos2unix ./load.sh && chmod +x ./load.sh

# Explicitly expose the port(s)
EXPOSE 27017

# Run the process and the loader
CMD ["./load.sh"]