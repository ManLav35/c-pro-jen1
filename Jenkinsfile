pipeline {
  agent any
  stages {
    stage('Checkout') { 
      steps { 
        checkout scm 
      } 
    }

    stage('Build') {
      steps {
        sh '''
          set -eux
          make clean || true
          make -j"$(nproc)"
        '''
      }
    }

    stage('Test') {
      steps {
        script {
          // Run the binary produced after build
          if (fileExists('a.out')) {
            echo "Running factorial tests with a.out"
            sh '''
              set -eux
              echo "5" | ./a.out > result.txt
              echo "Expected output: 120"
              cat result.txt
            '''
          } else if (fileExists('ABC.exe')) {
            echo "Running factorial tests with ABC.exe"
            sh '''
              set -eux
              echo "5" | ./ABC.exe > result.txt
              echo "Expected output: 120"
              cat result.txt
            '''
          } else {
            echo "No testable binary found, skipping tests"
          }
        }
      }
    }

    stage('Archive') {
      steps {
        archiveArtifacts artifacts: '**/*.exe, **/ABC*, **/a.out, result.txt', 
                          allowEmptyArchive: true, 
                          fingerprint: true
      }
    }
  }
  post { 
    always { 
      cleanWs() 
    } 
  }
}
