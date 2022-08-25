class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cpf
      t.string :number
      t.string :password
      t.integer :code
      t.date :valid

      t.timestamps
    end
  end
end
