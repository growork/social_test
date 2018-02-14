require_relative "printer"
require_relative "calculation"



name = ARGV[0]

name = name.encode("UTF-8") if Gem.win_platform? && ARGV[0]

name = "Аноним" if name == nil

puts "Добрый день, #{name}! Ответьте на вопросы."



tester = Printer.new

tester.q_print
tester.print_result(name)
