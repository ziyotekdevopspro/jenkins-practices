pipeline {
    agent any
	environment {
	 DOCKERHUB_CREDENTIALS = credentials('iamkhaihoang-dockerhub')
	 GITHUB_REPO_NAME = "iamkhaihoang/hello-app"
	 IMAGE_TAG = "1.0" 
	 IMAGE_NAME = "${GITHUB_REPO_NAME}:${IMAGE_TAG}"
	 JENKINS_DEPLOYED_MACHINE = "192.168.37.111"
	}
    stages {
        stage("Build Application") {
            steps {
                sh """
                    javac HelloWorld.java
                    #java HelloWorld
                """
            }
        }
        stage("Build Image of the Application") {
            steps {
                sh """
        		docker build -t $IMAGE_NAME .
                """
            }
        }		
        stage("DockerHub Login") {
            steps {
                sh('echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin')
            }
        }		
	stage("Push") {
            steps {
                sh """
			docker push $IMAGE_NAME
                """
            }
        }
	stage("Deploy") {
            steps {
		sh """
			ssh -o StrictHostKeyChecking=no $JENKINS_DEPLOYED_MACHINE docker system prune -f
			ssh -o StrictHostKeyChecking=no $JENKINS_DEPLOYED_MACHINE docker run $IMAGE_NAME
		"""
            }
        }
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}
