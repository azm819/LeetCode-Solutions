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
    func createBinaryTree(_ descriptions: [[Int]]) -> TreeNode? {
        var idToNode = [Int: TreeNode]()
        for description in descriptions {
            let parent: TreeNode
            if let node = idToNode[description[0]] {
                parent = node
            } else {
                parent = TreeNode(description[0])
                idToNode[description[0]] = parent
            }

            let child: TreeNode
            if let node = idToNode[description[1]] {
                child = node
            } else {
                child = TreeNode(description[1])
                idToNode[description[1]] = child
            }

            if description[2] == 1 {
                parent.left = child
            } else {
                parent.right = child
            }
        }

        var withoutParent = Set(idToNode.keys)
        for description in descriptions {
            withoutParent.remove(description[1])
        }

        return idToNode[withoutParent.first!]!
    }
}
