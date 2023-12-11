class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        var last: Int?
        var count = 0
        for int in arr {
            if int == last {
                count += 1
            } else {
                last = int
                count = 1
            }
            if count > arr.count / 4 {
                return int
            }
        }
        fatalError()
    }
}

