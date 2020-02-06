require_relative 'decode_morse_code_by_regexp'

class DecodeMorseCodeByBinary
  def call(input_morse_code)
    input_binary_code = morse_code_to_binary_code(input_morse_code)
    letter_with_binary_codes.map do |letter, binary_code|
      next unless with_the_same_level?(input_binary_code, binary_code)
      (input_binary_code & binary_code) == binary_code ? letter : nil
    end.compact
  end

  private

  # Encoding rules:
  # "." => 0b01
  # "-" => 0b10
  # "?" => 0b11
  def morse_code_to_binary_code(morse_code)
    morse_code.gsub('.', '01').gsub('-', '10').gsub('?', '11').to_i(2)
  end

  def letter_with_binary_codes
    DecodeMorseCodeByRegexp::LETTER_WITH_MORSE_CODES.map do |letter, morse_code|
      [letter, morse_code_to_binary_code(morse_code)]
    end.to_h
  end

  def with_the_same_level?(input_binary_code, binary_code)
    level_for(input_binary_code) == level_for(binary_code)
  end

  # example: 0b01, 0b10, 0b11 => 1
  # example: 0b0101, 0b0110, 0b0111, 0b1101, 0b1110, 0b1111 => 2
  def level_for(binary_code)
    binary_code_length = binary_code.to_s(2).length
    binary_code_length = binary_code_length + 1 unless binary_code_length.even?
    binary_code_length / 2
  end
end
