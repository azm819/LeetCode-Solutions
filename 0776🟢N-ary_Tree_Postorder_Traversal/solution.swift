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
    func postorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var stack: [(node: Node, isVisited: Bool)] = [(root, false)]
        var result = [Int]()
        while let (node, isVisited) = stack.popLast() {
            if isVisited {
                result.append(node.val)
            } else {
                stack.append((node, true))
                for child in node.children.reversed() {
                    stack.append((child, false))
                }
            }
        }

        return result
    }
}
