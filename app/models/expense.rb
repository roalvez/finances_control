#frozen_string_literal: true

class Expense < ApplicationRecord
  validates :value, :description, :due_at, :received_at, presence: true
end