require 'colorize'

def rainbow!(string)
  string
    .each_line
    .zip(%i(red yellow green magenta blue cyan))
    .map { |line, color| line.colorize(color) }
    .join
end

section 'World in MACRO-scope' do
  block <<-EOF
  text-substitution ⊂ procedural ⊂ syntactic
  EOF

  center <<-EOF
  text-substitution
  =
  search and replace
  EOF

  center 'sed'

  code "<?php define('GRAL', NULL)"

  center 'Not exactly constants'

  center <<-EOF
  procedural
  =
  Good ol' cpp
  EOF

  code <<-EOF, :c
  #define MAX(a, b) ((a) < (b) ? (a) : (b))

  int main() {
    printf("%d", MAX(666, 42));
  }
  EOF

  center <<-EOF
  syntactic
  =
  magic
  EOF
end

section 'Syntactic macros' do
  block <<-EOF
  #{'syntax'.bold} (ˈsɪnˌtæks) - set of rules, principles, and processes that govern
  the structure of sentences in given language.
  EOF

  block <<-EOF
  #{'macro'.bold} (ˈmæk.ɹəʊ) - a set of instructions in an abbreviated format
  EOF

  center 'Macros in Elixir require valid syntax inside invocation'

  block <<-EOF
  Almost everything is macro in Elixir:

  - `def` - https://github.com/elixir-lang/elixir/blob/c815227bd0068234e46548f22d28dc83fe6ad973/lib/elixir/lib/kernel.ex#L3446
  - `defmacro` - https://github.com/elixir-lang/elixir/blob/c815227bd0068234e46548f22d28dc83fe6ad973/lib/elixir/lib/kernel.ex#L3509
  - `|>` - https://github.com/elixir-lang/elixir/blob/c815227bd0068234e46548f22d28dc83fe6ad973/lib/elixir/lib/kernel.ex#L2910

  More can be found in `Kernel` documentation.
  EOF

  center 'But how?'

  block <<-EOF
  Syntactic macros have access to the AST (Abstract Syntax Tree). IIRC it origins
  in LISPs where this was obvious result of the syntax which was at the same time
  data on which you operate (lists).

  Scheme in Scheme: http://people.cs.aau.dk/~normark/prog3-03/html/notes/languages_themes-list-in-lisp.html
  EOF

  center 'Why mostly in "functional" languages?'

  center 'Wash your hands'

  block <<-EOF
  Macro hygene means, that no variable defined inside macro will pollute your
  namespace.
  EOF

  code <<-EOF, :elixir
  defmodule Camelot do
    defmacro table do
      quote do: ni = "Ni!"
    end
  end

  require Camelot

  ni = "Nu!"
  Camelot.table

  IO.puts ni #=> Nu!
  EOF
end

section 'When use?' do
  center 'In general - never'
end

center <<-EOF
  Thanks
#{'Łukasz Jan Niemier'.blue.bold}
  @hauleth
EOF
