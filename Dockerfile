FROM eclipse-temurin:21

RUN mkdir -p /opt/shinyproxy/
RUN wget https://shinyproxy.io/downloads/shinyproxy-3.1.0.jar -O /opt/shinyproxy/shinyproxy.jar
COPY application.yml /opt/shinyproxy/application.yml
COPY app.html /opt/shinyproxy/app.html
COPY login.html /opt/shinyproxy/login.html
COPY index.html /opt/shinyproxy/index.html

WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]
