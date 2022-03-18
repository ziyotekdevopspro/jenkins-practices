pipeline {
    agent any
    stages("Run HelloWorld") {
        steps {
            sh """
                javac HelloWorld.java
                java HelloWorld
            """
        }
    }
}