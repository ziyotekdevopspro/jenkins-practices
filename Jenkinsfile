pipeline {
    agent any
    stages {
        stage("Run HelloWorld") {
            steps {
                sh """
                    javac HelloWorld.java
                    #java HelloWorld
                """
            }
        }
    }
}
