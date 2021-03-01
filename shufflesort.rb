#!/usr/bin/ruby

module Enumerable
   def sorted?
      each_cons(2).all? { |a, b| (a <=> b) <= 0 }
   end
end

class Array
   def shufflesort!
      self.tap do |array|
         loop do
            break if array.sorted?
            array.shuffle!
         end
         array
      end
   end
end

ary = ARGV.map(&:to_i)

puts 'input missing' if ary.empty?

print ary.shufflesort!.join(' ')

puts
