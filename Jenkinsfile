pipeline {
    agent any  // This allows Jenkins to allocate an agent to run the job

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the code from the Git repository
                    checkout scm
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Ensure the `node` block is used for shell commands
                    node {
                        // Run the npm install inside the node block
                        sh 'npm install'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    node {
                        // Any build commands (e.g., Maven build or webpack) here
                        sh 'npm run build'  // For example, if you are using npm scripts
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    node {
                        // Deployment commands, if any
                        sh 'npm run deploy'  // Replace with the actual deploy command
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean-up or post actions, if needed
            echo 'This will always run after the build completes.'
        }
    }
}
