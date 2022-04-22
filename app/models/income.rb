#frozen_string_literal: true

class Income < ApplicationRecord
  validates :value, :description, :due_at, :received_at, presence: true
end