# frozen_string_literal: true

# Majority Element
# Given an array of size n, find the majority element.
# The majority element is the element that appears more than ⌊ n/2 ⌋ times.

# You may assume that the array is non-empty and the majority element always exist in the array.

# Example 1:

# Input: [3,2,3]
# Output: 3
# Example 2:

# Input: [2,2,1,1,1,2,2]
# Output: 2

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  count_tracker = {}
  min_majority = nums.length / 2 + 1
  nums.each do |num|
    count_tracker[num] = count_tracker[num].to_i + 1
    return num if count_tracker[num] >= min_majority
  end
end
