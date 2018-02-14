
class Printer

  # Метод печати вопросов
  def q_print
    @calc = Calculation.new
    # Создание переменной с путём к файлу с вопросами
    @current_path = File.dirname(__FILE__)
    questions_path = @current_path + '/data/questions.txt'

    # Проверка наличия файла с вопросами
    puts 'Файл не найден' unless File.exist?(questions_path)

    # Создание массива вопросов questions
    questions = IO.readlines(questions_path)

    questions.each do |item|
      puts item

      user_input = nil

      while user_input != "yes" && user_input != "no" && user_input != "sometimes" do
        puts "Введите yes, no или sometimes и нажмите Ввод"
        user_input = STDIN.gets.chomp
      end
      @calc.calculation_of_statistics(user_input)
    end
  end

  def print_result(user_name)
    name = user_name

    puts "\n #{name}"
    puts "\nВаш результат теста:" +
           "\nОтветов ДА - #{@calc.yes_answers}" +
           "\nОтветов НЕТ - #{@calc.no_answers}" +
           "\nОтветов ИНОГДА - #{@calc.sometimes_answers}" +
           "\nСумма очков - #{@calc.amount}\n\n\n"

    result_path = @current_path + "/data/#{@calc.calculation_of_results}.txt"
    File.exist?(result_path) ? (puts IO.readlines(result_path)):(puts "Файл с результатами не найден")
  end
end
