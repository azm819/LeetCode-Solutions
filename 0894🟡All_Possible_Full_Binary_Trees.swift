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
    private static var memo: [Int: [TreeNode]] = [
        1: [TreeNode()],
        2: [],
    ]

    func allPossibleFBT(_ n: Int) -> [TreeNode?] {
        if let mem = Solution.memo[n] {
            return mem
        }
        var result = [TreeNode]()
        let childsCount = n - 1
        for i in 1 ... childsCount - 1 {
            let allPossibleLeft = allPossibleFBT(i)
            let allPossibleRight = allPossibleFBT(childsCount - i)
            for left in allPossibleLeft {
                for right in allPossibleRight {
                    let node = TreeNode()
                    node.left = left
                    node.right = right
                    result.append(node)
                }
            }
        }
        Solution.memo[n] = result
        return result
    }
}
