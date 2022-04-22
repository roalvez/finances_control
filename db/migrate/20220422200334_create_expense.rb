class CreateExpense < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.decimal :value, null: false, precision: 20, scale: 2
      t.string :description, null: false, limit: 100
      t.date :due_at, null: false
      t.date :received_at, null: false

      t.timestamps
    end
  end
end
