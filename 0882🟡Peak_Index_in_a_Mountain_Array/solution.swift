class Solution {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        let n = arr.count - 1
        var l = 0
        var r = n
        while l <= r {
            let c = (l + r) / 2
            let hasDescentOnLeft = (c - 1) < 0 || arr[c - 1] < arr[c]
            let hasDescentOnRight = (c + 1) > n || arr[c + 1] < arr[c]
            switch (hasDescentOnLeft, hasDescentOnRight) {
            case (true, true):
                return c
            case (true, false):
                l = c + 1
            case (false, true):
                r = c - 1
            case (false, false):
                break
            }
        }
        return l
    }
}
