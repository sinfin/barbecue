module Barbecue::Blueprint
  class Model
    attr_reader :name, :attributes

    def initialize(name)
      @name = name
      @attributes = Attributes.new
    end

    def uses?(feature)
      case feature
      when :image, :images
        @attributes.find { |a| a.type.to_s =~ /images?/ }
      end
    end

    def human_name
      @name.to_s.humanize.capitalize
    end

    [ 'text','string','integer','decimal','boolean',
      'float','date','time','datetime','image'].each do |type|
      define_method type do |name,options = {}|
        @attributes << Attribute.new(name,type,options)
      end
    end
  end
end
