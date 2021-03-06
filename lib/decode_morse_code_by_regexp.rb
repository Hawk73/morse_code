# frozen_string_literal: true

class DecodeMorseCodeByRegexp
  LETTER_WITH_MORSE_CODES = {
    'A' => '.-',
    'D' => '-..',
    'E' => '.',
    'G' => '--.',
    'I' => '..',
    'K' => '-.-',
    'M' => '--',
    'N' => '-.',
    'O' => '---',
    'R' => '.-.',
    'S' => '...',
    'T' => '-',
    'U' => '..-',
    'W' => '.--'
  }.freeze

  def call(input_morse_code)
    regexp = regexp_for(input_morse_code)
    LETTER_WITH_MORSE_CODES.map do |letter, morse_code|
      morse_code.match(regexp) ? letter : nil
    end.compact
  end

  private

  def regexp_for(morse_code)
    escaped_morse_code = escape_dot_for(morse_code)
    /^#{escaped_morse_code.gsub('?', '[\.-]')}$/
  end

  def escape_dot_for(morse_code)
    morse_code.gsub('.', '\.')
  end
end
