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

class BSTIterator {
    private var nodes: [TreeNode]

    init(_ root: TreeNode?) {
        nodes = []
        var node = root
        while let n = node {
            nodes.append(n)
            node = n.left
        }
    }

    func next() -> Int {
        let lastNode = nodes.popLast()!
        defer {
            var node = lastNode.right
            while let n = node {
                nodes.append(n)
                node = n.left
            }
        }
        return lastNode.val
    }

    func hasNext() -> Bool {
        return !nodes.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
