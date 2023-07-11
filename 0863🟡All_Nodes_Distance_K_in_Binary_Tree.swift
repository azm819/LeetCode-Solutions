/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    private func traverse(_ root: TreeNode, _ edges: inout [Int: [Int]]) {
        if let left = root.left {
            edges[root.val, default: []].append(left.val)
            edges[left.val, default: []].append(root.val)
            traverse(left, &edges)
        }
        if let right = root.right {
            edges[root.val, default: []].append(right.val)
            edges[right.val, default: []].append(root.val)
            traverse(right, &edges)
        }
    }

    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        guard let root = root, let target = target else { return [] }
        var edges = [Int: [Int]]()
        traverse(root, &edges)
        var curK = 0
        var queue = [(-1, target.val)]
        while !queue.isEmpty {
            if curK == k {
                return queue.map(\.1)
            }
            var newQueue = [(Int, Int)]()
            for (anc, node) in queue {
                for child in edges[node, default: []] where child != anc {
                    newQueue.append((node, child))
                }
            }
            queue = newQueue
            curK += 1
        }
        return []
    }
}
