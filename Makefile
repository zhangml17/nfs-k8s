SHELL=/bin/bash
SCRIPTS=./auth
MANIFEST=./manifest

all:  deploy

deploy: export  OP=create
deploy:
	@kubectl ${OP} -f ${SCRIPTS}/rbac.yaml
	@kubectl ${OP} -f ${MANIFEST}/deployment.yaml
	@kubectl ${OP} -f ${MANIFEST}/storageclass.yaml

clean: export OP=delete
clean: 
	-@kubectl ${OP} -f ${MANIFEST}/storageclass.yaml
	-@kubectl ${OP} -f ${MANIFEST}/deployment.yaml
	-@kubectl ${OP} -f ${SCRIPTS}/rbac.yaml

test:
	#@kubectl create -f ${MANIFEST}/test-claim.yaml
	@kubectl create -f ${MANIFEST}/nginx.yaml
clean-test:
	#-@kubectl delete -f ${MANIFEST}/test-claim.yaml
	-@kubectl delete -f ${MANIFEST}/nginx.yaml

