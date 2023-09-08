/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue = [root]
        while !queue.isEmpty {
            var newQueue = [Node]()
            var prev: Node?
            for node in queue {
                prev?.next = node
                prev = node
                if let left = node.left {
                    newQueue.append(left)
                }
                if let right = node.right {
                    newQueue.append(right)
                }
            }
            queue = newQueue
        }
        return root
    }
}
