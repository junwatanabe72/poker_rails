module ResultsHelper
  def get_cards_number(result)
    cards = []
    (1..5).each { |num|
      cards << result[("card#{num}").to_sym]
    }
    return cards
  end

  def create_suits(cards)
    numbers = cards.map { |card|
      num = card % 100
      card - num
    }
    return numbers
  end

  def create_numbers(cards)
    numbers = cards.map { |card|
      card % 100
    }
    return numbers
  end

  def is_flush?(suits)
    if suits.count(suits[0]) == suits.length
      return true
    end
    return false
  end

  # num = [6,9,10,11,13]
  # num.count(6)
  def is_straight?(numbers)
    num = numbers.sort
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
    num = numbers.sort
    if num == [1, 10, 11, 12, 13]
      return true
    end
    return false
  end

  def is_pairs?(numbers)
    count_box = numbers.map { |number| numbers.count(number) }
    if count_box.include?(4)
      return 7
    end
    if count_box.include?(3) && count_box.include?(2)
      return 6
    end
    if count_box.include?(3)
      return 3
    end
    if count_box.include?(2) && count_box.length == 3
      return 2
    end
    if count_box.include?(2)
      return 1
    end
    return 0
  end

  def eval_hand(cards)
    ranks = { high: 0, one: 1, two: 2, three: 3, straight: 4, flush: 5, full: 6, four: 7, sflush: 8, royal: 9 }

    suits = create_suits(cards)
    numbers = create_numbers(cards)
    flush = is_flush?(suits)
    if (flush)
      royal_straight = is_royal_straight?(numbers)
      if (royal_straight)
        return 9
      end
      return 5
    end
    straight = is_straight?(numbers)
    if (straight)
      return 4
    end
    pairs = is_pairs?(numbers)
    return pairs
  end
end
