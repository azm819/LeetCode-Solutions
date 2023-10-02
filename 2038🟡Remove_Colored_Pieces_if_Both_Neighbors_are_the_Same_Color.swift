class Solution {
    func winnerOfGame(_ colors: String) -> Bool {
        var lastCh: Character?
        var countA = 0
        var countB = 0
        var count = 0
        for ch in colors {
            if lastCh != ch {
                if count > 2 {
                    if lastCh == "A" {
                        countA += count - 2
                    } else {
                        countB += count - 2
                    }
                }
                lastCh = ch
                count = 1
            } else {
                count += 1
            }
        }
        if count > 2 {
            if lastCh == "A" {
                countA += count - 2
            } else {
                countB += count - 2
            }
        }
        return countA > countB
    }
}

