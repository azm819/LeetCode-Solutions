class Solution {
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var visited = Set<String>()
        var multipleVisited = Set<String>()
        for string in arr {
            if !visited.insert(string).inserted {
                multipleVisited.insert(string)
            }
        }

        let onceVisited = visited.subtracting(multipleVisited)
        var k = k
        for string in arr where onceVisited.contains(string) {
            k -= 1
            if k == .zero {
                return string
            }
        }

        return ""
    }
}

