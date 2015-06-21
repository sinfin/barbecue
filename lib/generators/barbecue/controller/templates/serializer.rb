<% module_namespacing do -%>
class <%= serializer_class_name %> < ActiveModel::Serializer
  attributes :id, <%= attributes.select(&:scalar?).map { |a| ":#{a.name}" }.join(",") %>

<% attributes.select {|a| a.type == :image }.each do |a|  -%>
  has_one :<%= a.name %>, serializer: Admin::ImageSerializer
<% end -%>
end
<% end -%>