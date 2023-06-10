class Solution {
    private func sumBetween(_ a: Int, _ b: Int) -> Int {
        let sum = a + b
        let elements = abs(a - b) + 1
        return (sum / 2) * elements + (sum % 2 == 1 ? elements / 2 : 0)
    }

    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        var l = 0
        var r = maxSum
        let rightElems = n - 1 - index
        while l < r {
            let c = (l + r + 1) / 2
            var curSum = 0
            let leftB: Int
            if c <= index {
                leftB = 0
                curSum += index - c + 1
            } else {
                leftB = c - index
            }
            let rightB: Int
            if c <= rightElems {
                rightB = 0
                curSum += rightElems - c + 1
            } else {
                rightB = c - rightElems
            }
            curSum += sumBetween(leftB, c) + sumBetween(c, rightB) - c
            if curSum > maxSum {
                r = c - 1
            } else {
                l = c
            }
        }
        return l
    }
}
