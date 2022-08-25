class AlterCard < ActiveRecord::Migration[7.0]
  def change
    change_table :cards do |t|
      t.rename :valid, :valid_date
    end
  end
end
