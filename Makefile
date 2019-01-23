SHELL=/bin/bash
SCRIPTS=./auth

deploy: export  OP=create
deploy:
	@kubectl ${OP} -f ${SCRIPTS}/serviceaccount.yaml
	@kubectl ${OP} -f ${SCRIPTS}/clusterrole.yaml
	@kubectl ${OP} -f ${SCRIPTS}/clusterrolebinding.yaml
	
#	@kubectl patch deployment "nfs-client-provisioner" -p '{"spec":{"template":{"spec":{"serviceAccount":"nfs-client-provisioner"}}}}'
		
	@kubectl ${OP} -f ./deployment.yaml
	@kubectl ${OP} -f ./storageclass.yaml
	@kubectl ${OP} -f ./test-claim.yaml
	@kubectl ${OP} -f ./test-pod.yaml

clean: export OP=delete
clean: 
	-@kubectl ${OP} -f ./test-pod.yaml
	-@kubectl ${OP} -f ./test-claim.yaml
	-@kubectl ${OP} -f ./storageclass.yaml
	-@kubectl ${OP} -f ./deployment.yaml
	-@kubectl ${OP} -f ${SCRIPTS}/clusterrolebinding.yaml
	-@kubectl ${OP} -f ${SCRIPTS}/clusterrole.yaml
	-@kubectl ${OP} -f ${SCRIPTS}/serviceaccount.yaml

	

