class Solution {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var counts = [Int: Int]()
        for num in target {
            counts[num, default: .zero] += 1
        }

        for num in arr {
            if let count = counts[num] {
                if count == .zero {
                    return false
                }

                counts[num] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}

