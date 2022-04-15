pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                sh """
                    javac HelloWorld.java
                    #java HelloWorld
                """
            }
        }
		
		stage("Deploy") {
            steps {
                sh """
                    sudo docker build -t hello-app:1.0 .
		    sudo docker tag hello-app:1.0 iamkhaihoang/hello-app:1.0
		    sudo docker push iamkhaihoang/hello-app:1.0
                """
            }
        }
    }
}
