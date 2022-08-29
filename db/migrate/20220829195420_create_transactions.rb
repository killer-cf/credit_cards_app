class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :status, default: 0
      t.decimal :value
      t.string :order
      t.string :cpf
      t.string :number

      t.timestamps
    end
  end
end
