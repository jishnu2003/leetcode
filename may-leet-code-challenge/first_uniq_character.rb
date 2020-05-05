# frozen_string_literal: true

# First Unique Character in a String
# Given a string, find the first non-repeating character in it and return it's index.
# If it doesn't exist, return -1.

# Examples:

# s = "leetcode"
# return 0.

# s = "loveleetcode",
# return 2.
# Note: You may assume the string contain only lowercase letters.

# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  char_count = {}
  s.chars.each do |ch|
    char_count[ch] = char_count[ch].to_i + 1
  end
  s.chars.each_with_index do |ch, i|
    return i if char_count[ch] == 1
  end
  -1
end
