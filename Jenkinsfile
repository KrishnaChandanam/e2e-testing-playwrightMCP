pipeline {
    agent any
    
    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
        buildDiscarder(logRotator(numToKeepStr: '10'))
    }
    
    stages {
        stage('Checkout') {
            steps {
                echo '========== Checking out code =========='
                deleteDir()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], userRemoteConfigs: [[url: 'https://github.com/KrishnaChandanam/e2e-testing-playwrightMCP.git']]])
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo '========== Building Docker image =========='
                sh 'docker build -t intersport-tests:${BUILD_NUMBER} .'
                sh 'docker tag intersport-tests:${BUILD_NUMBER} intersport-tests:latest'
            }
        }
        
        stage('Run Tests in Docker') {
            steps {
                echo '========== Running Playwright tests in container =========='
                sh '''
                    docker run --rm \
                        -v ${WORKSPACE}:/workspace \
                        -e CI=true \
                        intersport-tests:latest
                '''
            }
        }
    }
    
    post {
        always {
            echo '========== Archiving test results =========='
            archiveArtifacts artifacts: 'test-results/**', allowEmptyArchive: true
            archiveArtifacts artifacts: 'playwright-report/**', allowEmptyArchive: true
            echo '========== Test artifacts saved =========='
        }
        
        failure {
            echo '========== Tests FAILED =========='
        }
        
        success {
            echo '========== Tests PASSED =========='
        }
    }
}
