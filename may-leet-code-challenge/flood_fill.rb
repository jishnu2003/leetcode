# frozen_string_literal: true

# Flood Fill
# An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

# Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

# To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

# At the end, return the modified image.

# Example 1:
# Input:
# image = [[1,1,1],[1,1,0],[1,0,1]]
# sr = 1, sc = 1, newColor = 2
# Output: [[2,2,2],[2,2,0],[2,0,1]]
# Explanation:
# From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
# by a path of the same color as the starting pixel are colored with the new color.
# Note the bottom corner is not colored 2, because it is not 4-directionally connected
# to the starting pixel.
# Note:

# The length of image and image[0] will be in the range [1, 50].
# The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
# The value of each color in image[i][j] and newColor will be an integer in [0, 65535].

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  source = image[sr][sc]
  return image if source == new_color

  rows = image.length
  cols = image[0].length
  dfs(image, sr, sc, new_color, rows, cols, source)
  image
end

def dfs(image, sr, sc, new_color, rows, cols, source)
  return if sr < 0 || sr >= rows || sc < 0 || sc >= cols
  return if image[sr][sc] != source

  image[sr][sc] = new_color
  dfs(image, sr - 1, sc, new_color, rows, cols, source) # TOP
  dfs(image, sr + 1, sc, new_color, rows, cols, source) # DOWN
  dfs(image, sr, sc - 1, new_color, rows, cols, source) # LEFT
  dfs(image, sr, sc + 1, new_color, rows, cols, source) # LEFT
end
