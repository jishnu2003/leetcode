# frozen_string_literal: true

# Valid Perfect Square
# Given a positive integer num, write a function which returns True if num is a perfect square else False.

# Note: Do not use any built-in library function such as sqrt.

# Example 1:

# Input: 16
# Output: true
# Example 2:

# Input: 14
# Output: false

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  sum = 0
  i = 1
  while sum < num
    sum += i
    i += 2
    return true if sum == num
  end
  false
end
