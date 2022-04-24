require 'rails_helper'

RSpec.describe 'Incomes', type: :request do
  describe 'POST /create' do
    subject(:create) { post incomes_path, params: body  }

    let(:body) do
      {
        income: {
          description: 'foo',
          value: 10,
          due_at: '2020-12-01'.to_date,
          received_at: '2020-12-01'.to_date
        }
      }
    end

    xit { is_expected.to have_https_status :ok }

    it 'changes Income object count' do
      expect { create } .to change(Income, :count).by(1)
    end
  end
end
