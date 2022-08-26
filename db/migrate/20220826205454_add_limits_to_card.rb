class AddLimitsToCard < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :total_limit, :decimal
    add_column :cards, :available_limit, :decimal
  end
end
