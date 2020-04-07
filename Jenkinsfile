pipeline {
	agent any
	stages {
		stage('Kubernetes cluster formation') {
			steps {
				withAWS(region:'ap-south-1', credentials:'aws-credentials') {
					sh '''
						eksctl create cluster \
						--name kubecluster \
						--version 1.13 \
						--nodegroup-name standard-workers \
						--node-type t2.small \
						--nodes 2 \
						--nodes-min 1 \
						--nodes-max 3 \
						--node-ami auto \
						--region ap-south-1 \
					'''
				}
			}
		}
	
        stage('Configuring: connecting kubectl w/ EKS cluster') {
                steps {
                    withAWS(region:'ap-south-1', credentials:'aws-credentials') {
                        sh '''
                            aws eks --region ap-south-1 update-kubeconfig --name kubecluster
                        '''
                    }
                }
            }
        }
}






	