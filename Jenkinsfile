pipeline {
  agent any
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Build') {
      steps {
        sh '''
          set -eux
          make clean || true
          make -j"$(nproc)"
        '''
      }
    }
    stage('Archive') {
      steps {
        archiveArtifacts artifacts: '**/*.exe, **/ABC*, **/a.out', allowEmptyArchive: true, fingerprint: true
      }
    }
  }
  post { always { cleanWs() } }
}
