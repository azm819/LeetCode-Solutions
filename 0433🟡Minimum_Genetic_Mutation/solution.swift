class Solution {
    private func isMutatable(_ lhs: String, _ rhs: String) -> Bool {
        var index = lhs.startIndex
        var distance = 0
        while index != lhs.endIndex {
            if lhs[index] != rhs[index] { distance += 1 }
            index = lhs.index(after: index)
        }
        return distance == 1
    }

    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        var queue = [startGene]
        var mutated = Array(repeating: false, count: bank.count)
        var mutations = 0
        while !queue.isEmpty {
            var newQueue = [String]()
            while let gene = queue.popLast() {
                if gene == endGene { return mutations }
                for i in 0 ..< bank.count where !mutated[i] && isMutatable(gene, bank[i]) {
                    mutated[i] = true
                    newQueue.append(bank[i])
                }
            }
            mutations += 1
            queue = newQueue
        }
        return -1
    }
}
