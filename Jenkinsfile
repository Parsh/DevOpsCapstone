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

        stage('Push to Dockerhub') {
			steps {
				withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD']]){
					sh '''
						docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
						docker push parsh24/capstone
					'''
				}
			}
		}

        stage('kubectl context settting') {
			steps {
				withAWS(region:'ap-south-1', credentials:'aws-credentials') {
					sh '''
						kubectl config use-context arn:aws:eks:ap-south-1:195488348571:cluster/kubecluster
					'''
				}
			}
		}

	}
}
