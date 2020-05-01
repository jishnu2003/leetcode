# frozen_string_literal: true

# First Bad Version

# You are a product manager and currently leading a team to develop a new product.
# Unfortunately, the latest version of your product fails the quality check.
# Since each version is developed based on the previous version, all the versions after a bad version are also bad.

# Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one,
# which causes all the following ones to be bad.

# You are given an API bool isBadVersion(version) which will return whether version is bad.
# Implement a function to find the first bad version. You should minimize the number of calls to the API.

# Example:

# Given n = 5, and version = 4 is the first bad version.

# call isBadVersion(3) -> false
# call isBadVersion(5) -> true
# call isBadVersion(4) -> true

# Then 4 is the first bad version.

# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  lowest_version = 1
  highest_version = n
  first_bad_version = n
  while lowest_version <= highest_version
    mid_version = (lowest_version + highest_version) / 2
    if is_bad_version(mid_version)
      first_bad_version = mid_version if mid_version < first_bad_version
      highest_version = mid_version - 1
    else
      lowest_version = mid_version + 1
    end
  end
  first_bad_version
end
