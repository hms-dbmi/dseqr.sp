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
# app.html fixes mobile bootstrap breakpoints (shinyproxy#96)
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/application.yml
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/app.html
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/login.html
wget https://raw.githubusercontent.com/hms-dbmi/drugseqr.sp/master/index.html
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

At this point, you could [install nginx](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-18-04), [add ssl certificates](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-18-04), and save an AMI image of your instance to [set up a scaled and load-balanced app](https://docs.aws.amazon.com/autoscaling/ec2/userguide/as-register-lbs-with-asg.html). See [nginx.conf](nginx.conf) for an example nginx configuration that redirects the landing page to a specific app.
