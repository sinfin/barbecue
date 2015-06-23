<%= application_name.camelize %>.<%= class_name.camelize %>Serializer = DS.ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  images: [ <%= image_attributes.map {|a| "'#{a.ember_name}'" }.join(',') %> ]
  attrs:
    <%- image_attributes.each do |attr| -%>
    <%= attr.ember_name %>:  { serialize: 'records', deserialize: 'records' }
    <%- end -%>

  typeForRoot: (key) ->
    if @get('images').indexOf(key) > 0
      'image'
    else
      @_super(key)
