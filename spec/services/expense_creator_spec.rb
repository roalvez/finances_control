# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpenseCreator, type: :service do
  describe '.create_expense' do
    subject(:create_expense) { described_class.new(attributes).create_expense }

    let(:attributes) do
      {
        description: 'foo',
        value: 10,
        due_at: '2020-12-01'.to_date,
        received_at: '2020-12-01'.to_date
      }
    end

    it { expect { create_expense }.to change(Expense, :count).by(1) }

    it 'returns an Expense with the correct attributes' do
      expect(create_expense).to have_attributes(attributes)
    end

    context 'when an error occurs' do
      before { allow(Expense).to receive(:create!).and_raise(StandardError) }

      it 'raises a custom error' do
        expect{ create_expense }.to raise_error(ExpenseCreator::CreationError)
      end
    end
  end
end