class Printer
  # Метод печати вопросов
  def q_print

    # Создание переменной с путём к файлу с вопросами
    @current_path = File.dirname(__FILE__)
    questions_path = @current_path + '/data/questions.txt'

    # Проверка наличия файла с вопросами
    unless File.exist?(questions_path)
      puts 'Файл не найден'
    end

    # Создание массива вопросов questions
    f = File.new(questions_path, "r:UTF-8")
    questions = f.readlines
    f.close

    @yes_answers = 0
    @no_answers = 0
    @sometimes_answers = 0
    @summ = 0

    for item in questions do
      puts item

      user_input = nil

      while user_input != "yes" && user_input != "no" && user_input != "sometimes" do
        puts "Введите yes, no или sometimes и нажмите Ввод"

        # Автоматический ввод за счёт $stdin
        user_input = gets.chomp.downcase
      end

      if user_input == "yes"
        @summ += 2
        @yes_answers += 1
      elsif user_input == "sometimes"
        @summ += 1
        @sometimes_answers += 1
      else
        @no_answers += 1
      end
    end

  end

  def r_print(user_name)
    name = user_name

    puts "\n #{name}"
    puts "\nВаш результат теста:" +
        "\nОтветов ДА - #{@yes_answers}" +
        "\nОтветов НЕТ - #{@no_answers}" +
        "\nОтветов ИНОГДА - #{@sometimes_answers}" +
        "\nСумма очков - #{@summ}\n\n\n"

    case @summ
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

    @current_path = File.dirname(__FILE__)
    result_path = @current_path + "/data/#{@counter}.txt"
    if File.exist?(result_path)
      f = File.new(result_path, "r:UTF-8")
      result = f.read
      f.close
      puts result
    else
      puts "Файл с результатами не найден"
    end
  end

end
