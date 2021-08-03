init:
	terraform -chdir=terraform init

plan:
	terraform -chdir=terraform plan

apply:
	terraform -chdir=terraform apply

ansible-ping:
	ansible all -m ping

install-requirements:
	ansible-galaxy install -r ansible/requirements.yml

ansible-deploy:
	ansible-playbook -i ansible/hosts ansible/playbook.yml --ask-vault-pass

