# frozen_string_literal: true

# Jewels and Stones
# You're given strings J representing the types of stones that are jewels, and S representing the stones you have.
# Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.

# The letters in J are guaranteed distinct, and all characters in J and S are letters.
# Letters are case sensitive, so "a" is considered a different type of stone from "A".

# Example 1:

# Input: J = "aA", S = "aAAbbbb"
# Output: 3
# Example 2:

# Input: J = "z", S = "ZZ"
# Output: 0
# Note:

# S and J will consist of letters and have length at most 50.
# The characters in J are distinct.
# @param {String} j
# @param {String} s
# @return {Integer}
def num_jewels_in_stones(j, s)
  jewel_tracker = {}
  total_jewels = 0
  return total_jewels if j.length.zero? || s.length.zero?

  j.chars.each do |jewel|
    jewel_tracker[jewel] = 0
  end

  s.chars.each do |stone|
    next unless jewel_tracker[stone]

    # jewel_tracker[stone] += 1
    total_jewels += 1
  end
  total_jewels
end
