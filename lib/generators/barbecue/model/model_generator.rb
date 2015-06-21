require_relative '../generator_helpers'
# require 'rails/generators/rails/model/model_generator'


#class Barbecue::ModelGenerator < Rails::Generators::ModelGenerator
# ActiveRecord::Generators::ModelGenerator
class Barbecue::ModelGenerator < Rails::Generators::NamedBase 
  source_root File.expand_path('../templates', __FILE__)

  argument :attributes, type: :array, default: [], banner: "field[:type][:index] field[:type][:index]"

  include Barbecue::GeneratorHelpers

  def initialize(*args)
    super
    @raw_attributes = args[0][1..-1]
  end
  
  def create_model_file
    Rails::Generators.invoke 'model', [ name, attributes.map(&:to_cli),
                                        force_flag, migration_flag ].flatten, {}

    #Rails.root.join("app/models/#{name}.rb")
    attributes.each { |a| a.finish(self) }

    # template 'model.rb', File.join('app/models', class_path, "#{file_name}.rb")
  end

  private

  def parse_attributes! #:nodoc:
    self.attributes = (attributes || []).map do |attr|
      Barbecue::Generators::GeneratedAttribute.parse(attr)
    end
  end
  

end