a. terraform.tfvars overrides anything specified in variables.tf
b. anything specified in CLI using --var-file or --var overrides terraform.tfvars
In the below e.g ext_port from west.tfvars will be picked up in plan rather than in terraform.tfvars

e.g terraform plan --var-file=west.tfvars

c. order of --var-file and --var matters when both are used together in CLI.
Whichever appears last overrides the previous

In the below example --var ext_port=2000 will be picked up by terraform plan
and not ext_port in west.tfvars

e.g terraform plan --var-file west-tfvars --var ext_port=2000

d. terraform plan -var="env=prod" | grep name