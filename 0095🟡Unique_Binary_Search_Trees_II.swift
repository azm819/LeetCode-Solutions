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
    private struct TreeKey: OptionSet, Hashable {
        var rawValue: Int
    }

    private static var memo: [TreeKey: [TreeNode]] = [
        TreeKey(rawValue: .zero): []
    ]

    private static let prefixMasks: [TreeKey] = {
        var masks = [TreeKey(rawValue: .zero)]
        for i in 1 ... 8 {
            masks.append(masks[i - 1].union(TreeKey(rawValue: 1 << i)))
        }
        return masks
    }()

    private static func dp(_ key: TreeKey) -> [TreeNode] {
        if let mem = memo[key] { return mem }
        var result = [TreeNode]()
        for i in 1 ... 8 where key.contains(TreeKey(rawValue: 1 << i)) {
            let leftTrees = dp(key.intersection(prefixMasks[i - 1]))
            let rightTrees = dp(key.subtracting(prefixMasks[i]))
            if leftTrees.isEmpty && rightTrees.isEmpty {
                result = [TreeNode(i)]
                break
            } else if leftTrees.isEmpty || rightTrees.isEmpty {
                for tree in leftTrees {
                    let node = TreeNode(i)
                    node.left = tree
                    result.append(node)
                }
                for tree in rightTrees {
                    let node = TreeNode(i)
                    node.right = tree
                    result.append(node)
                }
            } else {
                for leftTree in leftTrees {
                    for rightTree in rightTrees {
                        let node = TreeNode(i)
                        node.left = leftTree
                        node.right = rightTree
                        result.append(node)
                    }
                }
            }
        }
        memo[key] = result
        return result
    }

    func generateTrees(_ n: Int) -> [TreeNode?] {
        Solution.dp(Solution.prefixMasks[n])
    }
}
