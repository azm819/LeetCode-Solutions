/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard let curVal = preorder.first else { return nil }
        var leftIn = [Int]()
        var rightIn = [Int]()
        var leftSet = Set<Int>()
        var before = true
        for node in inorder {
            if node == curVal {
                before.toggle()
            }
            if before {
                leftIn.append(node)
                leftSet.insert(node)
            } else {
                rightIn.append(node)
            }
        }
        var leftPre = [Int]()
        var rightPre = [Int]()
        for node in preorder {
            if node == curVal {
                continue
            }
            if leftSet.contains(node) {
                leftPre.append(node)
            } else {
                rightPre.append(node)
            }
        }
        return TreeNode(curVal, buildTree(leftPre, leftIn), buildTree(rightPre, rightIn))
    }
}
