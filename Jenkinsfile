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
                    docker build -t hello-app:1.0 .
					docker tag hello-app:1.0 iamkhaihoang/hello-app:1.0
					docker push iamkhaihoang/hello-app:1.0
                """
            }
        }
    }
}
