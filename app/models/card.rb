class Card
  include ActiveModel::Model
  attr_accessor :id, :type, :is_hold

  def initialize(id:, type:, is_hold:)
    @id = id
    @type = type
    @is_hold = is_hold
  end
end
