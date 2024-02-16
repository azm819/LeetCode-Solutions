class Solution {
    func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
        var counts = [Int: Int]()
        for int in arr {
            counts[int, default: .zero] += 1
        }

        var k = k
        var result = counts.count
        for (_, count) in counts.sorted(by: { $0.value < $1.value }) {
            if k < count {
                break
            }
            k -= count
            result -= 1
        }
        return result
    }
}

