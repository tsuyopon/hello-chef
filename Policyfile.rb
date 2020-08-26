# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'hello-chef'

# Where to find external cookbooks:
# Below line stands for Pull dependent cookbooks from https://supermarket.chef.io/
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'hello-chef::default'

# Specify a custom source for a single cookbook:
# The name here must match the name in metadata.rb.
cookbook 'hello-chef', path: '.'
