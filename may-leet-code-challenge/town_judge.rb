# frozen_string_literal: true

# Find the Town Judge
# In a town, there are N people labelled from 1 to N.
# There is a rumor that one of these people is secretly the town judge.

# If the town judge exists, then:

# The town judge trusts nobody.
# Everybody (except for the town judge) trusts the town judge.
# There is exactly one person that satisfies properties 1 and 2.
# You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

# If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

# Example 1:

# Input: N = 2, trust = [[1,2]]
# Output: 2
# Example 2:

# Input: N = 3, trust = [[1,3],[2,3]]
# Output: 3
# Example 3:

# Input: N = 3, trust = [[1,3],[2,3],[3,1]]
# Output: -1
# Example 4:

# Input: N = 3, trust = [[1,2],[2,3]]
# Output: -1
# Example 5:

# Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
# Output: 3

# Note:

# 1 <= N <= 1000
# trust.length <= 10000
# trust[i] are all different
# trust[i][0] != trust[i][1]
# 1 <= trust[i][0], trust[i][1] <= N

# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  return n if n == 1

  trust_tracker = {}
  trust.each do |p1, p2|
    if trust_tracker[p1]
      trust_tracker[p1] << p2
    else
      trust_tracker[p1] = [p2]
    end
  end
  temp = trust_tracker.first[1]
  trust_tracker.each do |_p, p_trusts|
    temp &= p_trusts
  end
  return -1 if temp.empty? || temp.length > 1

  temp[0]
end
