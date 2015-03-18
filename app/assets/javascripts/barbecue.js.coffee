#= require_self
#= require_tree ./components
#= require_tree ./views
#= require_tree ./templates

Barbecue = Ember.Namespace.create()

Ember.Application.initializer
  name: 'barbecueInitializer'
  # FYI after: '...'
  # FYI before: '...'  

  initialize: (container,application) ->
    # FYI: store = container.lookup('store:main')
    # FYI: adapter = container.lookup('adapter:application')
    console.log 'Registering barbecue components'    
    container.register 'component:link-li', Barbecue.LinkLiComponent


# Export
window.Barbecue = Barbecue
