require_relative "testik_class"


name = ARGV[0]

if Gem.win_platform? && ARGV[0]
  name = name.encode("UTF-8")
end

if name == nil
	name = "Аноним"
end

puts "Добрый день, #{name}! Ответьте на вопросы."



tester = Printer.new

tester.q_print
tester.r_print(name)
