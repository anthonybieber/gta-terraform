#!/bin/bash

tput setaf 3
echo "-----------------"
echo "Stack Creation"
echo "-----------------"

tput sgr0
echo -n "Please enter the name of the stack you wish to create: "
read name

echo -n "Please enter the name of the product this stack effects [Examples: kidbiz, smartyants, a3k, actively_learn]: "
read product_name

working_dir=$(PWD)
mkdir stacks/$name
cp -r base/* stacks/$name

# Update qa env tag configuration
sed -i --expression "s@STACK_NAME@\"$name\"@g" stacks/$name/env/qa.tfvars
sed -i --expression "s@PRODUCT_NAME@\"$product_name\"@g" stacks/$name/env/qa.tfvars

# Update load env tag configuration
sed -i --expression "s@STACK_NAME@\"$name\"@g"  stacks/$name/env/load.tfvars
sed -i --expression "s@PRODUCT_NAME@\"$product_name\"@g" stacks/$name/env/load.tfvars

# Update prod env tag configuration
sed -i --expression "s@STACK_NAME@\"$name\"@g"  stacks/$name/env/prod.tfvars
sed -i --expression "s@PRODUCT_NAME@\"$product_name\"@g" stacks/$name/env/prod.tfvars

# Update backend.tf s3 key
sed -i --expression "s@STACK_NAME@$name@g" stacks/$name/backend.tf

# cleanup additional files (to investigate: why they are created)
rm stacks/$name/env/qa.tfvars--expression
rm stacks/$name/env/load.tfvars--expression
rm stacks/$name/env/prod.tfvars--expression
rm stacks/$name/backend.tf--expression

tput setaf 2
echo "You have created stack: $name"
echo "Directory created is in path: $working_dir/stacks/$name"