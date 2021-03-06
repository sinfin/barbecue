# Required property: currentPage
#
Barbecue.PaginationControlsComponent = Ember.Component.extend
  layoutName: 'components/barbecue/pagination'

  justOnePage: Ember.computed.equal('model.total_pages',1)
  first_page: Ember.computed.equal('model.current_page',1)
  empty: Ember.computed.equal('model.total',0)
  perPage: 20 # Volant.settings.perPage

  actions:
    setPage: (p) ->
      @set('currentPage',p)
      false

  previous_page: (->
    if @get('model.current_page') > 1
      @get('model.current_page') - 1
    else
      null
  ).property('model.current_page')

  next_page: (->
    if @get('model.current_page') < @get('model.total_pages')
      parseInt(@get('model.current_page')) + 1
    else
      null
  ).property('model.current_page')
