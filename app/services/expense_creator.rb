# frozen_string_literal: true

class ExpenseCreator
  class CreationError < StandardError; end

  attr_reader :attributes, :model

  def initialize(attributes, model = Expense)
    @attributes = attributes
    @model = model
  end

  def create_expense
    model.create!(expense_attributes)
  rescue StandardError => e
    message = "Error occured when creating an Expense. #{e.class}: #{e.message}"

    raise CreationError, message
  end

  private

  def expense_attributes
    {
      description: attributes[:description],
      value: attributes[:value],
      received_at: attributes[:received_at],
      due_at: attributes[:due_at]
    }
  end
end