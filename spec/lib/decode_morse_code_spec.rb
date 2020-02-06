require 'decode_morse_code'

RSpec.describe DecodeMorseCode do
  morse_codes_with_results =
    {
      # From task
      '?' => %w[E T],
      '?.' => %w[I N],
      '.?' => %w[I A],
      '?-?' => %w[R W G O],
      # Additional
      '??' => %w[I A N M], # two questions
      '...' => %w[S], # all dots
      '---' => %w[O] # all dashes
    }

  morse_codes_with_results.each do |morse_code, result|
    context "when morse_code is #{morse_code}" do
      it 'decodes letter' do
        expect(subject.call(morse_code)).to match_array(result)
      end
    end
  end
end
