/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    private var clones = [Int: Node]()

    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        if let clone = clones[node.val] {
            return clone
        }
        let clone = Node(node.val)
        clones[node.val] = clone
        clone.neighbors = node.neighbors.map(cloneGraph)
        return clone
    }
}
