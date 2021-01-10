class ChangeDataCardsToResults < ActiveRecord::Migration[6.1]
  def change
    change_column :results, :card1, :string
    change_column :results, :card2, :string
    change_column :results, :card3, :string
    change_column :results, :card4, :string
    change_column :results, :card5, :string
  end
end
