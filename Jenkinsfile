// pipeline {
//     agent any

//     environment {
//             // Define environment variables here
//             REGISTRY = '192.168.49.1:5100'
//             BACKEND_IMAGE = "${REGISTRY}/todo-app"
//             FRONTEND_IMAGE = "${REGISTRY}/todo-frontend"

//             TERRAFORM_DIR = 'infrastructure/terraform'

//             AWS_ACCESS_KEY_ID = 'test'
//             AWS_SECRET_ACCESS_KEY = 'test'
//             AWS_DEFAULT_REGION = 'us-east-1'

//             TF_IN_AUTOMATION = 'true'
//     }

//     stages{

//         stage('checkout'){
//             steps{
//                 checkout scm
//             }
//         }

//         stage('Enviroment Check'){
//             steps{
//                 sh ''' 
//                         echo "=== Docker ==="
//                         docker --version

//                         echo "=== kubectl ==="
//                         kubectl version --client

//                         echo "=== Minikube ==="
//                         minikube version

//                         echo "=== Registry ==="
//                         curl -f http://${REGISTRY}/v2/_catalog
                        
//                 '''
//             }
//         }

//         stage('Backend Test'){
//             steps{
//                 dir('backend'){
//                     sh '''
//                         npm ci --omit=dev
//                         node --check index.js
//                         node --check app.js
//                     '''
//                 }
//             }
//         }

//         stage('Frontend Test'){
//             steps{
//                 dir('to_do_app'){
//                     sh '''
//                         docker run --rm \
//                             -v "$WORKSPACE/to_do_app:/app" \
//                             -w /app \
//                             ghcr.io/cirruslabs/flutter:stable \
//                             bash -c "flutter pub get && flutter test"
//                     '''
//                 }
//             }
//         }

//         stage('Build Backend Image'){
//             steps{
//                 sh '''
//                     docker build \
//                         -t ${BACKEND_IMAGE}:${BUILD_NUMBER} \
//                         -t ${BACKEND_IMAGE}:latest \
//                         -f backend/Dockerfile \
//                         ./backend
//                 '''
//             }
//         }

//         stage('Build Frontend Image'){
//             steps{
//                 sh '''
//                     docker build \
//                         -t ${FRONTEND_IMAGE}:${BUILD_NUMBER} \
//                         -t ${FRONTEND_IMAGE}:latest \
//                         -f to_do_app/Dockerfile \
//                         ./to_do_app
//                 '''
//             }
//         }

//         stage('Push Images'){

//             steps{
//                 sh '''
//                     docker push ${BACKEND_IMAGE}:${BUILD_NUMBER}
//                     docker push ${BACKEND_IMAGE}:latest

//                     docker push ${FRONTEND_IMAGE}:${BUILD_NUMBER}
//                     docker push ${FRONTEND_IMAGE}:latest
//                 '''
//             }
//         }

//         stage('Deploy Backend'){
//             steps{
//                 sh '''
//                     kubectl apply -f infrastructure/k8s/backend-config.yaml
//                     kubectl apply -f infrastructure/k8s/backend-secret.yaml
//                     kubectl apply -f infrastructure/k8s/backend-deployment.yaml
//                     kubectl apply -f infrastructure/k8s/todo-backend-service.yaml

//                     kubectl set image deployment/todo-backend todo-backend=${BACKEND_IMAGE}:${BUILD_NUMBER} 

//                     kubectl rollout status deployment/todo-backend --timeout=120s

//                 '''
//             }
//         }

//         stage('Deploy Frontend'){
//             steps{
//                 sh '''
//                     kubectl apply -f infrastructure/k8s/frontend-deployment.yaml
//                     kubectl apply -f infrastructure/k8s/todo-frontend-service.yaml

//                     kubectl set image deployment/todo-frontend todo-frontend=${FRONTEND_IMAGE}:${BUILD_NUMBER}

//                     kubectl rollout status deployment/todo-frontend --timeout=120s

//                 '''
//             }
//         }

//         stage('Verify Deployment'){
//             steps{
//                 sh'''
//                     echo "=== Deployments ==="
//                         kubectl get deployments

//                         echo "=== Pods ==="
//                         kubectl get pods

//                         echo "=== Services ==="
//                         kubectl get services

//                         echo "=== Backend Image ==="
//                         kubectl get deployment todo-backend \
//                         -o jsonpath='{.spec.template.spec.containers[0].image}'
//                         echo

//                         echo "=== Frontend Image ==="
//                         kubectl get deployment todo-frontend \
//                         -o jsonpath='{.spec.template.spec.containers[0].image}'
//                         echo
//                 '''
//             }
//         }

//     }
//     post {
//                 success {
//                     echo "========================================="
//                     echo " CI/CD PIPELINE SUCCESSFUL"
//                     echo " Build: ${BUILD_NUMBER}"
//                     echo "========================================="
//                 }

//                 failure {
//                     echo "========================================="
//                     echo " CI/CD PIPELINE FAILED"
//                     echo " Build: ${BUILD_NUMBER}"
//                     echo "========================================="
//                 }

//                 always {
//                     sh '''
//                         echo "Pipeline completed."
//                         docker images | grep -E 'todo-app|todo-frontend' || true
//                     '''
//                 }
//     }
// }


```groovy
pipeline {
    agent any

    environment {
        REGISTRY = '192.168.49.1:5100'
        BACKEND_IMAGE = "${REGISTRY}/todo-app"
        FRONTEND_IMAGE = "${REGISTRY}/todo-frontend"

        TERRAFORM_DIR = 'infrastructure/terraform'

        // Floci
        AWS_ACCESS_KEY_ID = 'test'
        AWS_SECRET_ACCESS_KEY = 'test'
        AWS_DEFAULT_REGION = 'ap-south-1'

        TF_IN_AUTOMATION = 'true'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Environment Check') {
            steps {
                sh '''
                    set -e

                    echo "=============================="
                    echo " Environment Check"
                    echo "=============================="

                    echo "=== Docker ==="
                    docker --version

                    echo "=== kubectl ==="
                    kubectl version --client

                    echo "=== Minikube ==="
                    minikube version

                    echo "=== Terraform ==="
                    terraform version

                    echo "=== AWS CLI ==="
                    aws --version

                    echo "=== Floci ==="
                    curl -f http://localhost:4566/_localstack/health || \
                    curl -f http://localhost:4566/ || true

                    echo "=== Kubernetes Registry ==="
                    curl -f http://${REGISTRY}/v2/_catalog
                '''
            }
        }

        stage('Backend Test') {
            steps {
                dir('backend') {
                    sh '''
                        set -e

                        npm ci --omit=dev

                        node --check index.js
                        node --check app.js
                    '''
                }
            }
        }

        stage('Frontend Test') {
            steps {
                dir('to_do_app') {
                    sh '''
                        set -e

                        docker run --rm \
                            -v "$WORKSPACE/to_do_app:/app" \
                            -w /app \
                            ghcr.io/cirruslabs/flutter:stable \
                            bash -c "flutter pub get && flutter test"
                    '''
                }
            }
        }

        /*
         * ============================================================
         * TERRAFORM
         * ============================================================
         */

        stage('Terraform Init') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh '''
                        set -e

                        echo "=============================="
                        echo " Terraform Init"
                        echo "=============================="

                        terraform init -input=false
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh '''
                        set -e

                        echo "=============================="
                        echo " Terraform Validate"
                        echo "=============================="

                        terraform fmt -check
                        terraform validate
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh '''
                        set -e

                        echo "=============================="
                        echo " Terraform Plan"
                        echo "=============================="

                        terraform plan \
                            -input=false \
                            -out=tfplan
                    '''
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh '''
                        set -e

                        echo "=============================="
                        echo " Terraform Apply"
                        echo "=============================="

                        terraform apply \
                            -input=false \
                            -auto-approve \
                            tfplan
                    '''
                }
            }
        }

        stage('Terraform Output') {
            steps {
                dir("${TERRAFORM_DIR}") {
                    sh '''
                        echo "=============================="
                        echo " Terraform Resources"
                        echo "=============================="

                        terraform state list || true
                    '''
                }
            }
        }

        /*
         * ============================================================
         * DOCKER
         * ============================================================
         */

        stage('Build Backend Image') {
            steps {
                sh '''
                    set -e

                    docker build \
                        -t ${BACKEND_IMAGE}:${BUILD_NUMBER} \
                        -t ${BACKEND_IMAGE}:latest \
                        -f backend/Dockerfile \
                        ./backend
                '''
            }
        }

        stage('Build Frontend Image') {
            steps {
                sh '''
                    set -e

                    docker build \
                        -t ${FRONTEND_IMAGE}:${BUILD_NUMBER} \
                        -t ${FRONTEND_IMAGE}:latest \
                        -f to_do_app/Dockerfile \
                        ./to_do_app
                '''
            }
        }

        stage('Push Images') {
            steps {
                sh '''
                    set -e

                    echo "Pushing backend image..."

                    docker push ${BACKEND_IMAGE}:${BUILD_NUMBER}
                    docker push ${BACKEND_IMAGE}:latest

                    echo "Pushing frontend image..."

                    docker push ${FRONTEND_IMAGE}:${BUILD_NUMBER}
                    docker push ${FRONTEND_IMAGE}:latest
                '''
            }
        }

        /*
         * ============================================================
         * KUBERNETES DEPLOYMENT
         * ============================================================
         */

        stage('Deploy Backend') {
            steps {
                sh '''
                    set -e

                    kubectl apply -f infrastructure/k8s/backend-config.yaml
                    kubectl apply -f infrastructure/k8s/backend-secret.yaml
                    kubectl apply -f infrastructure/k8s/backend-deployment.yaml
                    kubectl apply -f infrastructure/k8s/todo-backend-service.yaml

                    kubectl set image \
                        deployment/todo-backend \
                        todo-backend=${BACKEND_IMAGE}:${BUILD_NUMBER}

                    kubectl rollout status \
                        deployment/todo-backend \
                        --timeout=120s
                '''
            }
        }

        stage('Deploy Frontend') {
            steps {
                sh '''
                    set -e

                    kubectl apply -f infrastructure/k8s/frontend-deployment.yaml
                    kubectl apply -f infrastructure/k8s/todo-frontend-service.yaml

                    kubectl set image \
                        deployment/todo-frontend \
                        todo-frontend=${FRONTEND_IMAGE}:${BUILD_NUMBER}

                    kubectl rollout status \
                        deployment/todo-frontend \
                        --timeout=120s
                '''
            }
        }

        stage('Verify Deployment') {
            steps {
                sh '''
                    set -e

                    echo "=============================="
                    echo " Deployments"
                    echo "=============================="

                    kubectl get deployments

                    echo "=============================="
                    echo " Pods"
                    echo "=============================="

                    kubectl get pods

                    echo "=============================="
                    echo " Services"
                    echo "=============================="

                    kubectl get services

                    echo "=============================="
                    echo " Backend Image"
                    echo "=============================="

                    kubectl get deployment todo-backend \
                        -o jsonpath='{.spec.template.spec.containers[0].image}'

                    echo

                    echo "=============================="
                    echo " Frontend Image"
                    echo "=============================="

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
            echo " Terraform: APPLIED"
            echo " Docker: BUILT & PUSHED"
            echo " Kubernetes: DEPLOYED"
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

                echo "=== Docker Images ==="
                docker images | grep -E 'todo-app|todo-frontend' || true

                echo "=== Terraform State ==="
                terraform -chdir=${TERRAFORM_DIR} state list || true
            '''
        }
    }
}
```
