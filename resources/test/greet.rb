resource_name :mycookbook_greet

# see: https://docs.chef.io/custom_resources/#syntax
property :greeting, String, default: 'Hello'

action :run do
  log "#{new_resource.greeting} world"
end
