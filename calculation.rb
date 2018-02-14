class Calculation
  attr_reader :amount, :sometimes_answers, :no_answers, :yes_answers
  def initialize
    @yes_answers = 0
    @no_answers = 0
    @sometimes_answers = 0
    @amount = 0
    @counter = nil
  end

  def calculation_of_statistics(user_input)
    if user_input == "yes"
      @amount += 2
      @yes_answers += 1
    elsif user_input == "sometimes"
      @amount += 1
      @sometimes_answers += 1
    else
      @no_answers += 1
    end
  end

  def calculation_of_results
    case @amount
    when 30..32
      @counter = 0
    when 25..29
      @counter = 1
    when 19..24
      @counter = 2
    when 14..18
      @counter = 3
    when 9..13
      @counter = 4
    when 4..8
      @counter = 5
    when 0..3
      @counter = 6
    else
      abort "Ошибка в подсчётах, попробуйте снова!"
    end
  end
end