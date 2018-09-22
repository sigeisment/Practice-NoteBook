pipeline {
  agent any
  stages {
    stage('build') {
      agent {
        docker {
          image 'billryan/gitbook'
          args '-v $PWD:/gitbook'
        }

      }
      steps {
        sh 'gitbook init'
        sh 'gitbook install'
        sh 'gitbook build'
        sh 'mv _book / && chmod 777 /build -R'
      }
    }
    stage('run') {
      agent any
      steps {
        sh 'sh start.sh'
      }
    }
  }
}