# encoding: utf-8

# Класс, отвечающий за чтение слова для игры

class WordReader
  attr_reader :ARGV[0]

  def file_not_exist?(file_name)
    !File.exist?(file_name)
  end

  def read_from_file(file_name)
    if file_not_exist?(file_name)
      return nil
    end

    f = File.new(file_name, "r:UTF-8")
    lines = f.readlines
    f.close

    lines.sample.chomp
  end
end
