require "./game.rb"
require "./result_printer.rb"

# создаем объект, печатающий результаты
printer = ResultPrinter.new

slovo = ARGV[0]

# создаем объект типа Game, в конструкторе нужно передать загаданное слово
game = Game.new(slovo)

# основной цикл программы, в котором развивается игра
# выходим из цикла, когда объект игры сообщит нам, c пом. метода status
while game.status == 0 do
  # выводим статус игры
  printer.print_status(game)
  # просим угадать следующую букву
  game.ask_next_letter
end

printer.print_status(game)
