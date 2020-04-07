pipeline {
	agent any
	stages {
		stage('Lint HTML') {
			steps {
				sh 'tidy -q -e *.html'
			}
		}

		stage('Docker Image: Build') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker build -t parsh24/capstone .
					'''
				}
			}
		}

        stage('Push To Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push parsh24/capstone
					'''
				}
			}
		}

        stage('Kubectl Context Settting') {
			steps {
				withAWS(region:'ap-south-1', credentials:'aws-credentials') {
					sh '''
						kubectl config use-context arn:aws:eks:ap-south-1:195488348571:cluster/kubecluster
					'''
				}
			}
		}

       stage('Blue Container Deployment') {
			steps {
				withAWS(region:'ap-south-1', credentials:'aws-credentials') {
					sh '''
						kubectl apply -f ./blue-green/controllers/blue-controller.json
					'''
				}
			}
		} 

        stage('Green Container Deployment') {
			steps {
				withAWS(region:'ap-south-1', credentials:'aws-credentials') {
					sh '''
						kubectl apply -f ./blue-green/controllers/green-controller.json
					'''
				}
			}
		}

	}
}
