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
    private enum Direction: Character {
        case up = "U"
        case left = "L"
        case right = "R"
    }

    @discardableResult
    private func findPath(_ node: TreeNode?, _ target: Int, _ path: inout [Direction]) -> Bool {
        guard let node = node else {
            return false
        }

        if node.val == target {
            return true
        }

        path.append(.left)
        if findPath(node.left, target, &path) {
            return true
        }
        path.removeLast()

        path.append(.right)
        if findPath(node.right, target, &path) {
            return true
        }
        path.removeLast()

        return false
    }

    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        var startPath = [Direction]()
        findPath(root, startValue, &startPath)
        var destPath = [Direction]()
        findPath(root, destValue, &destPath)

        var commonElements: Int = .zero
        while commonElements < startPath.count && commonElements < destPath.count {
            if startPath[commonElements] == destPath[commonElements] {
                commonElements += 1
            } else {
                break
            }
        }

        return String(repeating: Direction.up.rawValue, count: startPath.count - commonElements) + destPath.dropFirst(commonElements).map(\.rawValue)
    }
}
