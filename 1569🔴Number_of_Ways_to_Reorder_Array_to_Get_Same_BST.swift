class Solution {
    private static let pascalsTriangle: [[Int]] = {
        var pascalsTriangle = [[1], [1, 1]]
        for i in 2...1000 {
            pascalsTriangle.append(Array(repeating: 1, count: i + 1))
            for j in 1..<i {
                pascalsTriangle[i][j] = (pascalsTriangle[i - 1][j - 1] + pascalsTriangle[i - 1][j]) % Solution.modValue
            }
        }
        return pascalsTriangle
    }()
    private static let modValue = 1_000_000_007

    final class Node {
        let value: Int
        var count: Int
        var left: Node?
        var right: Node?

        init(value: Int, count: Int = 1, left: Node? = nil, right: Node? = nil) {
            self.value = value
            self.count = count
            self.left = left
            self.right = right
        }
    }

    private func addValue(_ node: Node, _ value: Int) {
        if node.value > value {
            if let left = node.left {
                addValue(left, value)
            } else {
                let newNode = Node(value: value)
                node.left = newNode
            }
        } else {
            if let right = node.right {
                addValue(right, value)
            } else {
                let newNode = Node(value: value)
                node.right = newNode
            }
        }
        node.count += 1
    }

    private func traverse(_ node: Node) -> Int {
        guard let left = node.left, let right = node.right else {
            if let left = node.left {
                return traverse(left)
            } else if let right = node.right {
                return traverse(right)
            }
            return 1
        }
        var permutations = Solution.pascalsTriangle[left.count + right.count][left.count]
        permutations *= traverse(left)
        permutations %= Solution.modValue
        permutations *= traverse(right)
        permutations %= Solution.modValue
        return permutations
    }

    func numOfWays(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return .zero }
        let rootNode = Node(value: nums[0])
        for i in 1..<nums.count {
            addValue(rootNode, nums[i])
        }
        return (traverse(rootNode) - 1 + Solution.modValue) % Solution.modValue
    }
}
