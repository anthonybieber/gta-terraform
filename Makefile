TERRAFORM_BIN:=terraform

# Run create stack shell script
create_stack:
	./create_stack.sh

# Initialize a stack: Terraform init o specified stack and create prod, load, and qa workspaces
# Example usage: make init_stack STACK=<stack_name>
init_stack:
ifndef STACK
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
	cd stacks/$(STACK); pwd; $(TERRAFORM_BIN) init; $(TERRAFORM_BIN) workspace select prod || $(TERRAFORM_BIN) workspace new prod; $(TERRAFORM_BIN) workspace select load || $(TERRAFORM_BIN) workspace new load; $(TERRAFORM_BIN) workspace select qa || $(TERRAFORM_BIN) workspace new qa;

# Output a stack plan with terraform terraform based on Stack and Environment
# Example usage: make plan STACK=<stack_name> ENV=<env_name>
# Accepted ENV options: qa, load, or prod
plan:
ifndef STACK
	@tput setaf 1
	@echo "STACK not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifndef ENV
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifeq ($(ENV), qa)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select qa; $(TERRAFORM_BIN) plan -var-file="env/qa.tfvars";
else ifeq ($(ENV), load)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select load; $(TERRAFORM_BIN) plan -var-file="env/load.tfvars";
else ifeq ($(ENV), prod)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select prod; $(TERRAFORM_BIN) plan -var-file="env/prod.tfvars";
else
	@tput setaf 1
	@echo "Wrong evironment specified: $(ENV)"
	@echo "Please use options: qa, load, or prod"
	@tput sgr0
	@exit 1
endif

# Apply a stack with terraform based on Stack and Environment
# Example usage: make apply STACK=<stack_name> ENV=<env_name>
# Accepted ENV options: qa, load, or prod
apply:
ifndef STACK
	@tput setaf 1
	@echo "STACK not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifndef ENV
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifeq ($(ENV), qa)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select qa; $(TERRAFORM_BIN) apply -var-file="env/qa.tfvars";
else ifeq ($(ENV), load)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select load; $(TERRAFORM_BIN) apply -var-file="env/load.tfvars";
else ifeq ($(ENV), prod)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select prod; $(TERRAFORM_BIN) apply -var-file="env/prod.tfvars";
else
	@tput setaf 1
	@echo "Wrong evironment specified: $(ENV)"
	@echo "Please use options: qa, load, or prod"
	@tput sgr0
	@exit 1
endif

# Destroy a stack with terraform based on Stack and Environment
# Example usage: make destroy STACK=<stack_name> ENV=<env_name>
# Accepted ENV options: qa, load, or prod
destroy:
ifndef STACK
	@tput setaf 1
	@echo "STACK not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifndef ENV
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
ifeq ($(ENV), qa)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select qa; $(TERRAFORM_BIN) destroy -var-file="env/qa.tfvars";
else ifeq ($(ENV), load)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select load; $(TERRAFORM_BIN) destroy -var-file="env/load.tfvars";
else ifeq ($(ENV), prod)
	cd stacks/$(STACK); $(TERRAFORM_BIN) workspace select prod; $(TERRAFORM_BIN) destroy -var-file="env/prod.tfvars";
else
	@tput setaf 1
	@echo "Wrong evironment specified: $(ENV)"
	@echo "Please use options: qa, load, or prod"
	@tput sgr0
	@exit 1
endif
