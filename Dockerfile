#https://vinothkumar-p.medium.com/jenkins-docker-image-with-pre-installed-plugins-152f5fa23a98
FROM jenkins/jenkins:alpine
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
USER root
RUN apk add docker
RUN apk add py-pip

USER jenkins
