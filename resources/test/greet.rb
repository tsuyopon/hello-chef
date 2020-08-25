resource_name :mycookbook_greet

property :greeting, String, default: 'Hello'

action :run do
  log "#{new_resource.greeting} world"
end
