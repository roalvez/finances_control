# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'valalidations' do
    it { is_expected.to validate_presence_of(:value) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:due_at) }
    it { is_expected.to validate_presence_of(:received_at) }
  end
end
