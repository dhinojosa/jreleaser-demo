# Run Jenkins
docker network create jenkins
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 \
  jenkins/jenkins

ADMIN_PASSWORD=$(docker exec jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword)
#JENKINS_URL=http://localhost:8080
#wget $JENKINS_URL/jenkins/jnlpJars/jenkins-cli.jar
#java -jar jenkins-cli.jar -s http://localhost:8080/jenkins/

#echo "Press any key to continue"
#while [ true ] ; do
#read -t 3 -n 1
#if [ $? = 0 ] ; then
#exit ;
#else
#echo "waiting for the keypress"
#fi
#dones
#
#docker stop jenkins-docker
#rm jenkins-cli.jar


