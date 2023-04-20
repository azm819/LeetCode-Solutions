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
    private func helper(
        _ node: TreeNode?,
        _ isLeft: Bool,
        _ curOffset: Int,
        _ curLvl: Int,
        _ offsets: inout [(Int, Int)]
    ) {
        guard let node = node else { return }
        let index = isLeft ? -curOffset : curOffset - 1
        if curLvl < offsets.count {
            offsets[curLvl] = (min(index, offsets[curLvl].0), max(index, offsets[curLvl].1))
        } else {
            offsets.append((index, index))
        }
        let newUpperOffset = curOffset * 2
        let newDownOffset = newUpperOffset - 1
        helper(node.left, isLeft, isLeft ? newUpperOffset : newDownOffset, curLvl + 1, &offsets)
        helper(node.right, isLeft, isLeft ? newDownOffset : newUpperOffset, curLvl + 1, &offsets)
    }

    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return .zero }
        if root.left == nil && root.right != nil {
            return widthOfBinaryTree(root.right)
        }
        if root.left != nil && root.right == nil {
            return widthOfBinaryTree(root.left)
        }
        var offsets = [(Int, Int)]()
        helper(root.left, true, 1, 0, &offsets)
        helper(root.right, false, 1, 0, &offsets)
        return offsets.map { $0.1 - $0.0 + 1 }.max() ?? 1
    }
}
