require 'colorize'

section 'Flip-Flop &. Space Rocket' do
  section 'Warp Speed, Mr Sulu' do
    center 'O <=> O'.bold

    center 'Most generic way to compare things in Ruby'
    center 'Returns one of the values [-1, 0, +1]'

    center 'Use case?'
    code <<-EOS
      [1, 2, 3, 4, 5].sort_by { |a, b| b <=> a }
      # => [5, 4, 3, 2, 1]
    EOS
  end

  section 'Celebrity Splat!' do
    center '*Celebrity'.bold

    center 'Mostly used in function definition'
    code <<-EOS
      def foo(*args)
        puts args
      end
    EOS

    center 'But check this out'
    code '[*1..10] # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]'
    center 'or that'
    code <<-EOS
      def bar(a, b)
        puts a + b
      end

      bar(*[4, 2]) # => 6
    EOS
  end

  section 'Drat!' do
    center '**bloody_hell'.bold
  end

  section 'Flip & Flop' do
    center 'maybe..maybe_not'.bold

    center 'In most cases range operator'
    code '1..10'

    center 'But what if?'
    code <<-EOS
      %i(let show you some magic of flop).each do |i|
        print i, ' ' if (i == :some)..(i == :flop)
      end
      # => some magic of flop
    EOS

    center 'SORCERY!!!'.red
  end

  section 'Everybody need somebody, even lonely operator' do
    center 'a&.b'

    center 'Also called "safe navigation operator"'
    center 'or "null coercion operator"'

    code <<-EOS
      # Booring
      current_user&.id

      # Fancier
      maybe_maybe &.== HotStuff

      # Oh my gosh!
      maybe_no&.-@&.+(10)
    EOS
  end

  section 'Magic of equality' do
    center '==='.bold

    code '(something === String) <=> something.is_a?(String)'
    code '-> a { puts a } === 10 # => 10'

    center 'But WHY?'

    code <<-EOS
      print 'My name is '
      case a
      when String then puts 'what?'
      when -> a { a == 10 } then puts 'who?'
      else puts 'Slim Shady!'
      end
    EOS
  end
end

center <<-EOS
  Thanks
  #{'Łukasz Jan Niemier'.blue.bold}
  @hauleth
EOS
