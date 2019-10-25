# drugseqr.sp

Create a docker network that ShinyProxy will use to communication with the Shiny containers and build the ShinyProxy image:

```bash
# create the docker network
sudo docker network create sp-example-net

# get Dockerfile for ShinyProxy image
mkdir drugseqr.sp
cd drugseqr.sp
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/Dockerfile

# customize application.yml before building based on the name of your app/authentication/etc.
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/application.yml
sudo docker build -t drugseqr.sp .
```

Optionally, double check that ShinyProxy works:

```bash
# pull example image for testing
sudo docker pull openanalytics/shinyproxy-demo

# run shiny proxy container
sudo docker run -it -v /var/run/docker.sock:/var/run/docker.sock --net sp-example-net -p 8080:8080 drugseqr.sp
```

Navigate to http://localhost:8080 or [EC2 public DNS]:8080 and check that the 'Hello Application' works. 