class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.integer :victory
      t.integer :card1
      t.integer :card2
      t.integer :card3
      t.integer :card4
      t.integer :card5
      t.timestamps
    end
  end
end
