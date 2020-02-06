# frozen_string_literal: true

require 'decode_morse_code_by_binary'

RSpec.describe DecodeMorseCodeByBinary do
  MORSE_CODES_WITH_RESULTS.each do |morse_code, result|
    context "when morse_code is #{morse_code}" do
      it 'decodes letter' do
        expect(subject.call(morse_code)).to match_array(result)
      end
    end
  end
end
