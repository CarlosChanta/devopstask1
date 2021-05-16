pipeline {
  agent{
    node {
      label 'master'
    }
  }
 
  stages {
 
	  stage('Initialize'){
	    steps{
		    script{
			  def dockerHome = tool 'myDocker'
			  env.PATH = "${dockerHome}/bin:${env.PATH}"
		  }
	    }
	  }
	  
    stage('build') {
	  agent { docker { image 'python:3' } }
      steps {
        sh 'pip install -r requirements.txt && python ${WORKSPACE}/src/test.py'
      }
    }
	
    stage('test') {
	    agent { docker { image 'python:3' } }
      steps {
        sh 'python ${WORKSPACE}/src/test.py'
      }
    }
	
    stage('Docker Image') {
      steps{
	      sh 'docker build -t tecamia-devops-image:v1.0 .'
		  }
    }
		
    stage('Run Image / Container Creation') {
      steps{
		    sh 'docker run -p 5000:5000 -d --name tecamia-devops tecamia-devops-image:v1.0'
		  }
    }
  }
}