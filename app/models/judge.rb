class Judge
  include ActiveModel::Model
  attr_accessor :hands, :numbers, :suits, :rank, :sub

  def initialize(hands)
    @hands = hands
  end

  RANK = { high: 0,
           one: 1,
           two: 2,
           three: 3,
           straight: 4,
           flush: 5,
           full: 6,
           four: 7,
           sflush: 8,
           royal: 9 }

  def self.start(params)
    @judge = Judge.new(params)
    @judge.rank = @judge.eval_hand
    @judge
  end

  def eval_hand()
    self.numbers = get_numbers(self.hands)
    self.suits = get_suits(self.hands)
    max_number = self.numbers.max
    if (is_flush?(self.suits))
      if (is_royal_straight?(self.numbers))
        self.sub = max_number
        return RANK[:royal]
      end
      if (is_straight?(self.numbers))
        self.sub = max_number
        return RANK[:sflush]
      end
      self.sub = max_number
      return RANK[:flush]
    end
    if (is_straight?(self.numbers))
      self.sub = max_number
      return RANK[:straight]
    end
    return is_pairs?(self.numbers)
  end

  private

  def get_numbers(hands)
    hands.map { |card|
      card.id.to_i
    }
  end

  def get_suits(hands)
    hands.map { |card|
      card.type
    }
  end

  def is_flush?(suits)
    if suits.count(suits[0]) == suits.length
      return true
    end
    return false
  end

  def is_straight?(numbers)
    num = numbers.map { |number| number }.sort
    if num[1] == num[0] + 1 &&
       num[2] == num[0] + 2 &&
       num[3] == num[0] + 3 &&
       num[4] == num[0] + 4 ||
       num == [1, 10, 11, 12, 13]
      return true
    end
    return false
  end

  def is_royal_straight?(numbers)
    num = numbers.map { |number| number }.sort
    if num == [1, 10, 11, 12, 13]
      return true
    end
    return false
  end

  def is_pairs?(numbers)
    count_box = numbers.map { |number| numbers.count(number) }

    def exchange_1_to_14(number)
      number == 1 ? 14 : number
    end

    if index = count_box.index(4)
      self.sub = exchange_1_to_14(numbers[index])
      return RANK[:four]
    end
    if count_box.index(3) && count_box.index(2)
      index = count_box.index(3)
      index2 = count_box.index(2)
      self.sub = exchange_1_to_14(numbers[index]) + exchange_1_to_14(numbers[index2])
      return RANK[:full]
    end
    if index = count_box.index(3)
      self.sub = exchange_1_to_14(numbers[index])
      return RANK[:three]
    end
    if count_box.count(2) == 4
      index = count_box.index(1)
      numbers[index]
      self.sub = numbers.map { |number| exchange_1_to_14(number) }.sum - exchange_1_to_14(numbers[index])
      return RANK[:two]
    end
    if index = count_box.index(2)
      self.sub = exchange_1_to_14(numbers[index])
      return RANK[:one]
    end
    self.sub = numbers.include?(1) ? 14 : numbers.max
    return 0
  end
end
