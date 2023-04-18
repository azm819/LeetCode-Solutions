class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let arr2 = arr2.sorted()
        let n = arr2.count - 1
        return arr1.reduce(into: 0) { result, num in
            var l = 0
            var r = n
            while l <= r {
                let c = (l + r) / 2
                if abs(num - arr2[c]) <= d {
                    return
                } else if arr2[c] > num {
                    r = c - 1
                } else {
                    l = c + 1
                }
            }
            result += 1
        }
    }
}
