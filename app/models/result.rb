class Result < ApplicationRecord
  has_many :user_results
  has_many :users, through: :user_results
end
