# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IncomeCreator, type: :service do
  describe '.create_income' do
    subject(:create_income) { described_class.new(attributes).create_income }

    let(:attributes) do
      {
        description: 'foo',
        value: 10,
        due_at: '2020-12-01'.to_date,
        received_at: '2020-12-01'.to_date
      }
    end

    it { expect { create_income }.to change(Income, :count).by(1) }

    it 'returns an Income with the correct attributes' do
      expect(create_income).to have_attributes(attributes)
    end

    context 'when an error occurs' do
      before { allow(Income).to receive(:create!).and_raise(StandardError) }

      it 'raises a custom error' do
        expect{ create_income }.to raise_error(IncomeCreator::CreationError)
      end
    end
  end
end