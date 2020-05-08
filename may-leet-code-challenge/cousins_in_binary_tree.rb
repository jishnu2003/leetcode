# frozen_string_literal: true

# Cousins in Binary Tree

# In a binary tree, the root node is at depth 0, and children of each depth k node are at depth k+1.
# Two nodes of a binary tree are cousins if they have the same depth, but have different parents.
# We are given the root of a binary tree with unique values, and the values x and y of two different nodes in the tree.
# Return true if and only if the nodes corresponding to the values x and y are cousins.

# Example 1:

# Input: root = [1,2,3,4], x = 4, y = 3
# Output: false

# Example 2:

# Input: root = [1,2,3,null,4,null,5], x = 5, y = 4
# Output: true

# Example 3:

# Input: root = [1,2,3,null,4], x = 2, y = 3
# Output: false

# Note:
# The number of nodes in the tree will be between 2 and 100.
# Each node has a unique integer value from 1 to 100.

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
  x_depth = find_depth_rec(root, x, 1)
  y_depth = find_depth_rec(root, y, 1)
  return false if x_depth != y_depth

  !is_sibling(root, x, y)
end

def find_depth_rec(current_node, val, depth)
  return 0 if current_node.nil?
  return depth if current_node.val == val

  l = find_depth_rec(current_node.left, val, depth + 1)
  return l if l != 0

  find_depth_rec(current_node.right, val, depth + 1)
end

def is_sibling(current_node, x, y)
  return false if current_node.nil?

  (current_node.left&.val == x && current_node.right&.val == y) ||
    (current_node.left&.val == y && current_node.right&.val == x) ||
    is_sibling(current_node.left, x, y) ||
    is_sibling(current_node.right, x, y)
end
