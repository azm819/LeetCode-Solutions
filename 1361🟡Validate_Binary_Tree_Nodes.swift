class Solution {
    func validateBinaryTreeNodes(_ n: Int, _ leftChild: [Int], _ rightChild: [Int]) -> Bool {
        let children = Set(leftChild + rightChild)
        var queue = [Int]()
        for i in 0 ..< n where !children.contains(i) {
            queue.append(i)
        }
        guard queue.count == 1 else { return false }
        var visited = Set<Int>()
        while !queue.isEmpty {
            var newQueue = [Int]()
            for node in queue {
                if !visited.insert(node).inserted {
                    return false
                }
                if leftChild[node] != -1 {
                    newQueue.append(leftChild[node])
                }
                if rightChild[node] != -1 {
                    newQueue.append(rightChild[node])
                }
            }
            queue = newQueue
        }
        return visited.count == n
    }
}

