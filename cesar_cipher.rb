class CesarCipher
  attr_accessor :text
  RU_FREQUENCY = [['о', 0.10983], ['е', 0.08483], ['а', 0.07996], ['и', 0.07367]]
  EN_FREQUENCY = [['e', 0.1286], ['t', 0.0972], ['a', 0.0796], ['i', 0.0777], ['n', 0.0751]]
  SHIFT_LETTERS = [('а'..'я'), ('А'..'Я'), ('a'..'z'), ('A'..'Z')]

  def initialize(filename)
    @text = File.open(filename, 'r'){ |f| f.read }
    @text = @text[0..10000]
  end

  def decode(n)
    @new_text = ""
    shift_letters = SHIFT_LETTERS.map{|x| x.to_a}
    @text.each_char do |letter|
      shift_letters.each do |alphabet|
        if alphabet.include?(letter)
          letter = shift_letter(letter, n, alphabet)
          break
        end
      end
      @new_text += letter
    end
    @new_text
  end

  alias_method :encode, :decode

  def found_shift
    if count_letters_ru >= count_letters_en
      frequency_ru[0][0].ord - RU_FREQUENCY[0][0].ord
    else
      frequency_en[0][0].ord - RU_FREQUENCY[0][0].ord
    end
  end

  def count_letters_ru
    letters = SHIFT_LETTERS[0, 2].map{|x| x.to_a}.flatten.join
    @text.count(letters)
  end

  def count_letters_en
    letters = SHIFT_LETTERS[2, 2].map{|x| x.to_a}.flatten.join
    @text.count(letters)
  end

  def frequency_ru
    frequency_letters(/[а-яА-Я]/)
  end

  def frequency_en
    frequency_letters(/[a-zA-Z]/)
  end

  private

  def shift_letter(letter, n, alphabet)
    count_letters = alphabet.size
    code_letter = letter.ord + n
    if code_letter < alphabet.first.ord
      code_letter += count_letters
    elsif code_letter > alphabet.last.ord
      code_letter -= count_letters
    end
    code_letter.chr(Encoding::UTF_8)
  end

  # частота символов и их количество
  def frequency_letters(regexp)
    frequency = {}
    count_letters = 0
    @text.each_char do |letter|
      if letter =~ regexp
        count_letters += 1
        frequency[letter] = frequency[letter].nil? ? 1 : frequency[letter] + 1
      end
    end
    frequency.each{|k, v| frequency[k] = v / count_letters.to_f }
    frequency.to_a.sort{|x,y| y[1] <=> x[1]}
  end
end

if __FILE__ == $0
  original_filename = 'cesar_original.txt'
  coded_filename = 'cesar_coded.txt'
  decoded_filename = 'cesar_decoded.txt'
  shift_code = 10

  cipher = CesarCipher.new(original_filename)
  puts cipher.frequency_ru.to_s
  puts cipher.frequency_en.to_s
  coded_text = cipher.text = cipher.encode(shift_code)[0..10000]
  File.open(coded_filename, 'w'){ |f| f.write coded_text }

  puts cipher.found_shift
  File.open(decoded_filename, 'w'){ |f| f.write cipher.encode(-cipher.found_shift) }
end
