def projectName = 'finalproject' 
def bcName = 'finalproject'
def dcName = 'finalproject'
pipeline {
  agent none
  stages {
    stage('build') {
      steps {
        script {
            openshift.withCluster() {
                openshift.withProject(projectName) {
                  def builds = openshift.selector("bc", bcName).startBuild('-F')
                }
            }
        }
      }
    }
    stage('deploy') {
      steps {
        script {
            openshift.withCluster() {
                openshift.withProject(projectName) {
                  def rm = openshift.selector("dc", dcName).rollout().latest()
                }
            }
        }
      }
    }
  }
}
