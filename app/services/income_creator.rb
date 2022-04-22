# frozen_string_literal: true

class IncomeCreator
  class CreationError < StandardError; end

  attr_reader :attributes, :model

  def initialize(attributes, model = Income)
    @attributes = attributes
    @model = model
  end

  def create_income
    model.create!(income_attributes)
  rescue StandardError => e
    message = "Error occured when creating an Income. #{e.class}: #{e.message}"

    raise CreationError, message
  end

  private

  def income_attributes
    {
      description: attributes[:description],
      value: attributes[:value],
      received_at: attributes[:received_at],
      due_at: attributes[:due_at]
    }
  end
end