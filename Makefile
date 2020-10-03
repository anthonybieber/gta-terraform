# Run create stack shell script
create_stack:
	./create_stack.sh

# Initialize a stack: Terraform init o specified stack and create prod, load, and qa workspaces
init_stack:
ifndef STACK
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif
	@tput setaf 3
	@echo "Initializing stack $(STACK)"
	@tput sgr0
	cd stacks/$(STACK); pwd; terraform init; terraform workspace new prod; terraform workspace new load; terraform workspace new qa;

# TO BE FINISHED
plan:
ifndef STACK
	@tput setaf 1
	@echo "ENV not defined, try :"
	@echo "	make STACK=<stack_name> ENV=<env> $(MAKECMDGOALS)"
	@tput sgr0
	@exit 1
endif