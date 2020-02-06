# Task – Азбука морзе

![Graph](graph.png?raw=true "Graph")

```
-.- переводится как K
... переводится как S
.- переводится как A
-- переводится как M
. переводится как E
```

Вам надо расшифровать сообщение, но к сожалению сигнал был
частично потерян. Вы знаете порядок, но некоторые символы
были утеряны. Потерянные сигналы обозначаются как “?”. Вам
нужно определить возможные буквы для каждой
последовательности сигналов.
Напишите класс, который принимает на вход строку с
последовательностью и возвращает массив возможных букв.
Например:
```
? должен вернуть ['E','T']
?. должен вернуть ['I','N']
.? должен вернуть ['I','A']
?-? должен вернуть ['R','W','G','O']
```

## Development

        $ bundle install
        $ bundle exec irb
        # # Version with regexp
        $ require_relative 'lib/decode_morse_code_by_regexp'
        $ DecodeMorseCodeByRegexp.new.call('?')
        # # Version with logical compare
        $ require_relative 'lib/decode_morse_code_by_binary'
        $ DecodeMorseCodeByBinary.new.call('?')

## Test

        $ make test
