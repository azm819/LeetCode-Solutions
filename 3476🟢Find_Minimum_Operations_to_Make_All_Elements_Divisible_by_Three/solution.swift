class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        nums.reduce(0) { partialResult, num in
            num % 3 == .zero ? partialResult : partialResult + 1
        }
    }
}

