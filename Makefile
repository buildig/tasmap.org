make deploy:
	gulp build
	aws s3 sync ./dist s3://tasmap.org --acl public-read

make run:
	gulp serve

make deploy-infrastructure:
	AWS_DEFAULT_REGION=ap-southeast-2 \
	aws cloudformation create-stack \
		--stack-name tasmap-infrastructure \
		--template-body file://s3infra.json \
		--parameters ParameterKey=DomainName,ParameterValue=tasmap.org