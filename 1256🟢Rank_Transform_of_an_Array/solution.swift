class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let sortedArr = Set(arr).sorted()
        let ranks = sortedArr.reduce(into: [Int: Int]()) { partialResult, num in
            partialResult[num] = partialResult.count + 1
        }

        return arr.map { ranks[$0]! }
    }
}

