# frozen_string_literal: true

# Check If It Is a Straight Line
# You are given an array coordinates, coordinates[i] = [x, y],
# where [x, y] represents the coordinate of a point.
# Check if these points make a straight line in the XY plane.

# Example 1:

# Input: coordinates = [[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]]
# Output: true
# Example 2:

# Input: coordinates = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
# Output: false

# Constraints:
# - 2 <= coordinates.length <= 1000
# - coordinates[i].length == 2
# - -10^4 <= coordinates[i][0], coordinates[i][1] <= 10^4
# - coordinates contains no duplicate point.

# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
  coord_len = coordinates.length - 1
  return true if coord_len.zero?

  slope = get_slope(coordinates[0], coordinates[1])
  prev_point = coordinates[1]
  (2..coord_len).each do |i|
    return false if get_slope(prev_point, coordinates[i]) != slope

    prev_point = coordinates[i]
  end
  true
end

def get_slope(point1, point2)
  (point2[1] - point1[1]) / (point2[0] - point1[0])
rescue StandardError => _e
  false
end
