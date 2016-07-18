#!groovy

node('docker') {
  git url: 'https://github.com/kbalonek/jenkins-multibranch'
  echo 'Branch is: $BRANCH_NAME'
  sh 'ls -l'
  sh 'go version'
}
