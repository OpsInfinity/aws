apply:
	rm -rf .terraform .terraform.lock.hcl
	terraform init
	terraform apply -auto-approve
	rm -rf .terraform .terraform.lock.hcl


destroy:
	rm -rf .terraform .terraform.lock.hcl
	terraform init
	terraform destroy -auto-approve
	rm -rf .terraform .terraform.lock.hcl


# apply:
# 	rm -rf .terraform
# 	terraform init -backend-config=env-dev/state.tfvars
# 	terraform apply -auto-approve -var-file=env-dev/inputs.tfvars


# destroy:
# 	rm -rf .terraform
# 	terraform init -backend-config=env-dev/state.tfvars
# 	terraform destroy -auto-approve -var-file=env-dev/inputs.tfvars
