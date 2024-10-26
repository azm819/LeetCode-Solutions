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
    private func calcHeight(
        _ node: TreeNode?,
        _ cache: inout [Int?: Int]
    ) -> Int {
        guard let node else { return .zero }

        let height = 1 + max(calcHeight(node.left, &cache), calcHeight(node.right, &cache))
        cache[node.val] = height
        return height
    }

    private func traverse(
        _ node: TreeNode?,
        _ curHeight: Int,
        _ maxHeight: Int,
        _ cache: inout [Int?: Int],
        _ result: inout [Int: Int]
    ) {
        guard let node else { return }

        result[node.val] = maxHeight

        traverse(
            node.left,
            curHeight + 1,
            max(maxHeight, curHeight + 1 + (cache[node.right?.val] ?? .zero)),
            &cache,
            &result
        )
        traverse(
            node.right,
            curHeight + 1,
            max(maxHeight, curHeight + 1 + (cache[node.left?.val] ?? .zero)),
            &cache,
            &result
        )
    }

    func treeQueries(_ root: TreeNode?, _ queries: [Int]) -> [Int] {
        var cache: [Int? : Int] = [:]
        _ = calcHeight(root, &cache)
        var result: [Int: Int] = [:]
        traverse(root, .zero, .zero, &cache, &result)
        return queries.map { result[$0]! - 1 }
    }
}
