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
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                echo '========== Building Docker image =========='
                script {
                    sh 'docker build -t intersport-tests:${BUILD_NUMBER} .'
                    sh 'docker tag intersport-tests:${BUILD_NUMBER} intersport-tests:latest'
                }
            }
        }
        
        stage('Run Tests in Docker') {
            steps {
                echo '========== Running Playwright tests in container =========='
                script {
                    sh '''
                        docker run --rm \
                            -v ${WORKSPACE}/test-results:/app/test-results \
                            -v ${WORKSPACE}/playwright-report:/app/playwright-report \
                            -e CI=true \
                            intersport-tests:latest
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo '========== Archiving test results =========='
            archiveArtifacts artifacts: 'test-results/**', allowEmptyArchive: true
            archiveArtifacts artifacts: 'playwright-report/**', allowEmptyArchive: true
            
            echo '========== Publishing HTML report =========='
            publishHTML([
                reportDir: 'playwright-report',
                reportFiles: 'index.html',
                reportName: 'Playwright Test Report'
            ])
        }
        
        failure {
            echo '========== Tests FAILED =========='
        }
        
        success {
            echo '========== Tests PASSED =========='
        }
    }
}
