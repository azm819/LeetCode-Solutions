class Solution {
    func restoreArray(_ adjacentPairs: [[Int]]) -> [Int] {
        var ends = Set<Int>()
        var neighs = [Int: [Int]]()
        for adjacentPair in adjacentPairs {
            let a = adjacentPair[0]
            let b = adjacentPair[1]

            if ends.contains(a) {
                ends.remove(a)
            } else {
                ends.insert(a)
            }
            if ends.contains(b) {
                ends.remove(b)
            } else {
                ends.insert(b)
            }

            neighs[a, default: []].append(b)
            neighs[b, default: []].append(a)
        }

        var result = [ends.randomElement()!]
        var visited = Set(result)
        while let last = result.last, let newNode = neighs[last]?.first(where: { !visited.contains($0) }) {
            result.append(newNode)
            visited.insert(newNode)
        }
        return result
    }
}

