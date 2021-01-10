class AddRankToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :rank, :integer
  end
end
