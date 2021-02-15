   #!groovy
   //Run docker bild
   
   properties ([disableConcurrentBilds()])
   
   pipline {
      agent {
        label 'main'
        }
      options {
        buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
        timestamps()
        }
      stages {
          stage ("create docker image") {
              steps {
                  echo "======== start bilding image======"
              dir ('docker/jmeter') {
                  sh 'docker build . '
          }
       }
    }
  }
}
