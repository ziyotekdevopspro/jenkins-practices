pipeline {
    agent any
	environment {
	 DOCKERHUB_CREDENTIALS = credentials('iamkhaihoang-dockerhub')
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
                    docker build -t iamkhaihoang/hello-app:1.0 .
                """
            }
        }		
        stage("DockerHub Login") {
            steps {
                sh """
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                """
            }
        }		
		stage("Push") {
            steps {
                sh """
		    docker push iamkhaihoang/hello-app:1.0
                """
            }
        }
    }
    post {
	always {
		sh """
		    docker logout
		"""
	}
    }
}
