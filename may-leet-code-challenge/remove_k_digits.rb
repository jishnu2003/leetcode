# frozen_string_literal: true

# Remove K Digits
# Given a non-negative integer num represented as a string, remove k digits from the number so that the new number is the smallest possible.

# Note:
# The length of num is less than 10002 and will be ≥ k.
# The given num does not contain any leading zero.
# Example 1:

# Input: num = "1432219", k = 3
# Output: "1219"
# Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
# Example 2:

# Input: num = "10200", k = 1
# Output: "200"
# Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.
# Example 3:

# Input: num = "10", k = 2
# Output: "0"
# Explanation: Remove all the digits from the number and it is left with nothing which is 0.

# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
  return '0' if num.length <= k
  return num if k.zero?

  my_stack = []
  num.chars.each do |ch|
    while !my_stack.empty? && k.positive? && my_stack.last > ch
      my_stack.pop
      k -= 1
    end

    my_stack.push(ch) if !my_stack.empty? || ch != '0'
  end
  while !my_stack.empty? && k.positive?
    my_stack.pop
    k -= 1
  end
  return '0' if my_stack.empty?

  my_stack.join('')
end
