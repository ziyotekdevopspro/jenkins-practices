pipeline {
    agent any
	environment {
	 DOCKERHUB_CREDENTIALS = credentials('iamkhaihoang-dockerhub')
	 GITHUB_REPO_NAME = "iamkhaihoang/hello-app"
	 IMAGE_TAG = 1.0 
	 IMAGE_NAME = "${GITHUB_REPO_NAME}:${IMAGE_TAG}"
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
                sh ('echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin')
            }
        }		
		stage("Push") {
            steps {
                sh """
					docker push $IMAGE_NAME
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
