pipeline {
    agent any

    environment {
        // Path to Liquibase
        LIQUIBASE_HOME = "/opt/liquibase"
        PATH = "${env.LIQUIBASE_HOME}:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your private repo
                git branch: 'main', url: 'https://github.com/snagendradba77/Liquebase.git'
            }
        }

        stage('Liquibase Update') {
            steps {
                // Verify Liquibase is available
                sh 'which liquibase || echo "Liquibase not found in PATH"'

                // Debug
                sh 'echo "Starting Liquibase update..."'

                // Run Liquibase using the properties file
                sh """
                    liquibase --defaultsFile=liquibase.properties update
                """
            }
        }
    }

    post {
        success {
            echo '✅ Liquibase update executed successfully!'
        }
        failure {
            echo '❌ Liquibase update failed!'
        }
    }
}

