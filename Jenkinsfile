#!groovy
//Run docker bild
   
properties ([disableConcurrentBilds()])
   
 pipeline {
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
              dir ('projects/jmeter') {
                  sh 'build'
                  }
               }
          stage ("Run jmeter-docker")
             steps {
                echo "======start run jmeter======"
                dir('projects/jmeter') {
                sh 'test'
                }
            }
    }
  }
}
