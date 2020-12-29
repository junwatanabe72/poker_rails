class CreateUserResults < ActiveRecord::Migration[6.1]
  def change
    create_table :user_results do |t|
      t.references :user, foreign_key: true
      t.references :result, foreign_key: true
      t.timestamps
    end
  end
end
