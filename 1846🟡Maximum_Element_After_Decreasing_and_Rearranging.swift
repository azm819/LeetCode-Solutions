class Solution {
    func maximumElementAfterDecrementingAndRearranging(_ arr: [Int]) -> Int {
        let n = arr.count
        var counts = [Int: Int]()
        for num in arr {
            counts[min(num, n), default: .zero] += 1
        }

        var result = 0
        for num in 1 ... n {
            result = min(result + counts[num, default: .zero], num)
        }
        return result
    }
}
