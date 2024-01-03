class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var occurrences = [Int: Int]()
        for num in arr {
            occurrences[num, default: .zero] += 1
        }
        return Set(occurrences.values).count == occurrences.count
    }
}

