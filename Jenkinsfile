pipeline {
    agent any

    environment {
            // Define environment variables here
            REGISTRY = '192.168.49.1:5100'
            BACKEND_IMAGE = "${REGISTRY}/todo-app"
            FRONTEND_IMAGE = "${REGISTRY}/todo-frontend"
    }

    stages{

        stage('checkout'){
            steps{
                checkout scm
            }
        }

        stage('Enviroment Check'){
            steps{
                sh ''' 
                        echo "=== Docker ==="
                        docker --version

                        echo "=== kubectl ==="
                        kubectl version --client

                        echo "=== Minikube ==="
                        minikube version

                        echo "=== Registry ==="
                        curl -f http://${REGISTRY}/v2/_catalog
                '''
            }
        }

        stage('Backend Test'){
            steps{
                dir('backend'){
                    sh '''
                        npm ci --omit=dev
                        node --check index.js
                        node --check app.js
                    '''
                }
            }
        }

        stage('Frontend Test'){
            steps{
                dir('to_do_app'){
                    sh '''
                        docker run --rm \
                            -v "$WORKSPACE/to_do_app:/app" \
                            -w /app \
                            ghcr.io/cirruslabs/flutter:stable \
                            bash -c "flutter pub get && flutter test"
                    '''
                }
            }
        }

        stage('Build Backend Image'){
            steps{
                sh '''
                    docker build \
                        -t ${BACKEND_IMAGE}:${BUILD_NUMBER} \
                        -t ${BACKEND_IMAGE}:latest \
                        -f backend/Dockerfile \
                        ./backend
                '''
            }
        }

        stage('Build Frontend Image'){
            steps{
                sh '''
                    docker build \
                        -t ${FRONTEND_IMAGE}:${BUILD_NUMBER} \
                        -t ${FRONTEND_IMAGE}:latest \
                        -f to_do_app/Dockerfile \
                        ./to_do_app
                '''
            }
        }

        stage('Push Images'){

            steps{
                sh '''
                    docker push ${BACKEND_IMAGE}:${BUILD_NUMBER}
                    docker push ${BACKEND_IMAGE}:latest

                    docker push ${FRONTEND_IMAGE}:${BUILD_NUMBER}
                    docker push ${FRONTEND_IMAGE}:latest
                '''
            }
        }

        stage('Deploy Backend'){
            steps{
                sh '''
                    kubectl apply -f infrastructure/k8s/backend-config.yaml
                    kubectl apply -f infrastructure/k8s/backend-secret.yaml
                    kubectl apply -f infrastructure/k8s/backend-deployment.yaml
                    kubectl apply -f infrastructure/k8s/todo-backend-service.yaml

                    kubectl set image deployment/todo-backend todo-backend=${BACKEND_IMAGE}:${BUILD_NUMBER} 

                    kubectl rollout status deployment/todo-backend --timeout=120s

                '''
            }
        }

        stage('Deploy Frontend'){
            steps{
                sh '''
                    kubectl apply -f infrastructure/k8s/frontend-deployment.yaml
                    kubectl apply -f infrastructure/k8s/todo-frontend-service.yaml

                    kubectl set image deployment/todo-frontend todo-frontend=${FRONTEND_IMAGE}:${BUILD_NUMBER}

                    kubectl rollout status deployment/todo-frontend --timeout=120s

                '''
            }
        }

        stage('Verify Deployment'){
            steps{
                sh'''
                    echo "=== Deployments ==="
                        kubectl get deployments

                        echo "=== Pods ==="
                        kubectl get pods

                        echo "=== Services ==="
                        kubectl get services

                        echo "=== Backend Image ==="
                        kubectl get deployment todo-backend \
                        -o jsonpath='{.spec.template.spec.containers[0].image}'
                        echo

                        echo "=== Frontend Image ==="
                        kubectl get deployment todo-frontend \
                        -o jsonpath='{.spec.template.spec.containers[0].image}'
                        echo
                '''
            }
        }

    }
    post {
                success {
                    echo "========================================="
                    echo " CI/CD PIPELINE SUCCESSFUL"
                    echo " Build: ${BUILD_NUMBER}"
                    echo "========================================="
                }

                failure {
                    echo "========================================="
                    echo " CI/CD PIPELINE FAILED"
                    echo " Build: ${BUILD_NUMBER}"
                    echo "========================================="
                }

                always {
                    sh '''
                        echo "Pipeline completed."
                        docker images | grep -E 'todo-app|todo-frontend' || true
                    '''
                }
    }
}