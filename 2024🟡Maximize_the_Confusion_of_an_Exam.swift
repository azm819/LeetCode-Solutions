class Solution {
    func maxConsecutiveAnswers(_ answerKey: String, _ k: Int) -> Int {
        let chars = Array(answerKey)
        var l = 1
        var r = answerKey.count
        var last: Character?
        var curCount = 0
        for char in chars {
            if char != last {
                l = max(l, curCount)
                curCount = 1
                last = char
            } else {
                curCount += 1
            }
        }
        l += k
        while l < r {
            let c = (l + r + 1) / 2
            var trueCount = 0
            var falseCount = 0
            var lb = 0
            var rb = -1
            while rb != c - 1 {
                rb += 1
                if chars[rb] == "T" {
                    trueCount += 1
                } else {
                    falseCount += 1
                }
            }
            var changable = trueCount <= k || falseCount <= k
            rb += 1
            while !changable && rb < chars.count {
                if chars[lb] == "T" {
                    trueCount -= 1
                } else {
                    falseCount -= 1
                }
                if chars[rb] == "T" {
                    trueCount += 1
                } else {
                    falseCount += 1
                }
                lb += 1
                rb += 1

                changable = trueCount <= k || falseCount <= k
            }

            if changable {
                l = c
            } else {
                r = c - 1
            }
        }
        return r
    }
}
