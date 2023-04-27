class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        for i in 0...c {
            let a = i * i
            if a > c {
                break
            }
            var l = 0
            var r = c - a
            while l <= r {
                let mid = (l + r) / 2
                let b = mid * mid
                let target = a + b
                if target == c {
                    return true
                } else if target < c {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return false
    }
}
