/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *    	   self.random = nil
 *     }
 * }
 */

class Solution {
    private var cache = [Node: Node]()

    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else { return nil }
        if let cachedNode = cache[head] {
            return cachedNode
        }
        let node = Node(head.val)
        cache[head] = node
        node.next = copyRandomList(head.next)
        node.random = copyRandomList(head.random)
        return node
    }
}
