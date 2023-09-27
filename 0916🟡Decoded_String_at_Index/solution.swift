class Solution {
    func decodeAtIndex(_ s: String, _ k: Int) -> String {
        var k = k
        while true {
            var curCount = 0

            for ch in s {
                if ch.isLetter {
                    curCount += 1
                    if curCount == k {
                        return String(ch)
                    }
                } else {
                    let d = Int(String(ch))!
                    let newCount = curCount * d
                    if k <= newCount {
                        k %= curCount
                        if k == .zero {
                            k = curCount
                        }
                        break
                    }
                    curCount = newCount
                }
            }
        }
        fatalError()
    }
}
