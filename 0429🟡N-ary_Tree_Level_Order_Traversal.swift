/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [[Int]]()
        while !queue.isEmpty {
            var newQueue = [Node]()
            var subRes = [Int]()
            for node in queue {
                subRes.append(node.val)
                newQueue.append(contentsOf: node.children)
            }
            queue = newQueue
            result.append(subRes)
        }
        return result
    }
}
