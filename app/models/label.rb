class Label
  include ActiveModel::Model
  extend ActiveModel::Naming

  attr_accessor :name, :description, :types, :enabled, :color

  def initialize attributes = {}
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def attribute_hash
    {
      name: name,
      description: description,
      types: types,
      enabled: enabled,
      color: color
    }
  end

  def save
    begin
      new_label = ApplicationController.helpers.desk.labels.create(attribute_hash)
      true
    rescue DeskApi::Error::UnprocessableEntity => e
      e.errors.each do |an_error|
        errors.add(an_error[0].to_sym, error_string(an_error[1]))
      end
      false
    rescue DeskApi::Error => e
      errors.add(e.class.name, e.to_s)
      false
    end
  end

  def persisted?
    false
  end

  private
  def error_string error_array
    if error_array && error_array.any?
      results = " is " + error_array.to_sentence
    else
      ""
    end
  end
end