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
    func recoverFromPreorder(_ traversal: String) -> TreeNode? {
        var ind = traversal.startIndex
        var value: Int! = 0
        while ind != traversal.endIndex && traversal[ind].isNumber {
            value *= 10
            value += traversal[ind].wholeNumberValue!
            ind = traversal.index(after: ind)
        }
        let root = TreeNode(value)

        var stack = [root]
        var level = 0
        value = nil
        
        let addValueIfNeeded = {
            guard value != nil else { return }
            while stack.count > level {
                stack.removeLast()
            }
            let newNode = TreeNode(value)
            let node = stack.last!
            if node.left == nil {
                node.left = newNode
            } else {
                node.right = newNode
            }
            stack.append(newNode)

            value = nil
            level = 0
        }

        while ind != traversal.endIndex {
            if traversal[ind].isNumber {
                if value == nil {
                    value = .zero
                }
                value *= 10
                value += traversal[ind].wholeNumberValue!
            } else {
                addValueIfNeeded()

                level += 1
            }
            ind = traversal.index(after: ind)
        }

        addValueIfNeeded()

        return root
    }
}
