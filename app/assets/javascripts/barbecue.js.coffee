#= require_self
#= require ./translated_property
#= require_tree ./adapters
#= require_tree ./transform
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
    container.register 'view:form-group', Barbecue.FormGroupView
    container.register 'view:date', Barbecue.DateField
    container.register 'transform:isodate', Barbecue.IsodateTransform


# Export
window.Barbecue = Barbecue
