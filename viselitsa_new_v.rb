require "./viselitsa_new _v_methods.rb"

# сначала очистим экран, чтобы не видно было загаданное слово
cls

puts "Игра виселица. Версия 2\n\n"

# создадим массив букв загаданного слова
letters = get_letters

# переменная-индикатор кол-ва ошибок, всего можно сделать не более 7 ошибок
errors = 0

# массивы, хранящие угаданные и неугаданные буквы
good_letters = []
bad_letters = []

# основной цикл программы, в котором опрашиваем пользователя и обновляем результаты
# всего у пользователя есть 7 шагов, чтобы успеть отгадать слово
while errors < 7 do
  # выводим текущий статус игры и если есть - открытые буквы
  print_status(letters, good_letters, bad_letters, errors)

  puts "\nВведите следующую букву"
  user_input = get_user_input

  # проверяем введенную букву спец. методом
  result = check_input(user_input, letters, good_letters, bad_letters)

  if (result == -1) # если метод вернул -1, значит буква не угадана, ошибка
    errors += 1  # увеличиваем счетчик ошибок
  elsif (result == 1) # если результат равен 1, значит пользователь угадал всё слово
    break # прерываем цикл
  end
end

# выводим напоследок результат игры
print_status(letters, good_letters, bad_letters, errors)
