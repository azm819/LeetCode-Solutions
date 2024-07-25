class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        nums.mergeSorted(from: nums.startIndex, to: nums.index(before: nums.endIndex))
    }
}

private extension Array where Element: Comparable {
    func mergeSorted(from: Index, to: Index) -> [Element] {
        guard from < to else {
            if from == to {
                return [self[from]]
            }
            return []
        }

        let mid = (from + to) / 2
        let leftSorted = mergeSorted(from: from, to: mid)
        let rightSorted = mergeSorted(from: mid + 1, to: to)
        var l = leftSorted.startIndex
        var r = rightSorted.startIndex
        var sorted = [Element]()
        while l != leftSorted.endIndex && r != rightSorted.endIndex {
            if leftSorted[l] < rightSorted[r] {
                sorted.append(leftSorted[l])
                l = leftSorted.index(after: l)
            } else {
                sorted.append(rightSorted[r])
                r = rightSorted.index(after: r)
            }
        }

        sorted.append(contentsOf: leftSorted[l...])
        sorted.append(contentsOf: rightSorted[r...])

        return sorted
    }
}
