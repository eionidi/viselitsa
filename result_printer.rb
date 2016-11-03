# encoding: utf-8

# Класс, печатающий состояние и результаты игры
#
# Логика взята из методов первой версии игры "виселица" (см. исходники прошлых уроков)

class ResultPrinter

  # основной метод, печатающий состояния объекта класса Game,
  # который нужно передать в качестве параметра
  def print_status(game)
    cls
    puts "\nСлово: #{get_word_for_print(game.letters, game.good_letters)}"

    # puts "Ошибки (#{game.errors}): #{game.bad_letters.to_s}" / 2 заменяется на:
    puts "Ошибки: #{game.bad_letters.join(", ").to_s}"
    # метод join возвращает элементы массива, объединенные в строку, с заданным разделителем

    print_viselitsa(game.errors)

    if game.status == -1
      puts "\nВы проиграли :(\n"
      puts "Загаданное слово было: " + game.letters.join("")
      puts
    elsif game.status == 1
      puts "Поздравляем, вы выиграли!\n\n"
    else
      puts "У вас осталось ошибок: " + (7 - game.errors).to_s
    end
  end


  # Служебный метод класса, возвращающий строку, изображающую загаданное слово
  # с открытыми угаданными буквами (см. подробности в исходниках первой версии игры)
  def get_word_for_print(letters, good_letters)
    result = ""

    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result
  end

  # /2
  # Метод, рисующий виселицу. Ему достаточно знать сколько сделано ошибок, поэтому параметр метода,
  # не весь объект типа Game, а всего лишь число ошибок
  def print_viselitsa(errors)
    # оператор case, аналогичен набору if (см. например http://www.programbeginner.ru/?p=337)
    case errors
      when 0
      puts "
          _______
          |/
          |
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        "
      when 1
        puts "
          _______
          |/
          |     ( )
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        "
      when 2
        puts "
          _______
          |/
          |     ( )
          |      |
          |
          |
          |
          |
          |
        __|________
        |         |
        "
      when 3
        puts "
          _______
          |/
          |     ( )
          |      |_
          |        \\
          |
          |
          |
          |
        __|________
        |         |
        "
      when 4
        puts "
          _______
          |/
          |     ( )
          |     _|_
          |    /   \\
          |
          |
          |
          |
        __|________
        |         |
        "
      when 5
        puts "
          _______
          |/
          |     ( )
          |     _|_
          |    / | \\
          |      |
          |
          |
          |
        __|________
        |         |
        "

      when 6
        puts "
          _______
          |/
          |     ( )
          |     _|_
          |    / | \\
          |      |
          |     / \\
          |    /   \\
          |
        __|________
        |         |
        "
      when 7
        puts "
          _______
          |/     |
          |     (_)
          |     _|_
          |    / | \\
          |      |
          |     / \\
          |    /   \\
          |
        __|________
        |         |
        "

    end
  end

  def cls
    system("clear") || system("cls")
  end
end
