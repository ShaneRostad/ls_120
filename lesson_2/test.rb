#Write a method that outputs its String argument 5 times over 5 lines.

#Every odd number line needs to be indented by the product of the line number multiplied by itself and every even number line number indented by the product of the line number multiplied by two.

# input:
# - a string

# output:
# - output the string input, 5 times, over 5 lines

# rules:
# - odd number line needs to be indented by the product of the line multiplied by itsself ( line number * line number )
# - even number line needs to be indented by the product of the line number multiplied by two ( line number * 2 )
# - line_number starts counting at 0


# steps:
# 1 - define a method printer(string)
# 2 - some sort of a looping structure
# - - - 0.upto(4) |line_number|
# 3 - check if line_number is odd or even
# - - - if num is odd, do something
# - - - elsif num is even, do something



def printer(string)
  0.upto(4) do |line_number|
    if line_number.even?
      puts "#{' ' * (line_number * 2)}#{string}"
    elsif line_number.odd?
      puts "#{' ' * (line_number * line_number)}#{string}"
    end
  end
end



printer('line')
#outputs the following:
#
# line
# line
#      line
#         line
#        line
