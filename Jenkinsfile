pipeline {
    agent any

    environment {
        // Path to Liquibase
        LIQUIBASE_HOME = "/opt/liquibase"
        PATH = "${env.LIQUIBASE_HOME}:${env.PATH}"

        // Database connection details
        DB_URL = "jdbc:sqlserver://localhost.localdomain:1433;databaseName=Naga"
        DB_USERNAME = "sa"
        DB_PASSWORD = "Mnbv*7894"
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

                // Debug what we are running
                sh 'echo "Starting Liquibase update..."'

                // Run Liquibase update safely (no backslash continuation issues)
                sh """
                    liquibase \
                      --changeLogFile="changelog/master.xml" \
                      --url="${DB_URL}" \
                      --username="${DB_USERNAME}" \
                      --password="${DB_PASSWORD}" \
                      update
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

