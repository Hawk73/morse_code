class DecodeMorseCode
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
  }

  def call(morse_code)
    regexp = regexp_for(morse_code)
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
