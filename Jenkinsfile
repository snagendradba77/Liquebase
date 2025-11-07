pipeline {
    agent any

    environment {
        // Path to liquibase
        LIQUIBASE_HOME = "/opt/liquibase"
        PATH = "${env.LIQUIBASE_HOME}:${env.PATH}"
        
        // Database connection (make sure it matches liquibase.properties)
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
                // Run Liquibase update
                sh """
                liquibase --changeLogFile=changelog/master.xml \
                          --url=${DB_URL} \
                          --username=${DB_USERNAME} \
                          --password=${DB_PASSWORD} \
                          update
                """
            }
        }
    }

    post {
        success {
            echo 'Liquibase update executed successfully!'
        }
        failure {
            echo 'Liquibase update failed!'
        }
    }
}

