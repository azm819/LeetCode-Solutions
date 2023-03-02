class Solution {
    private func writeIn(_ chars: inout [Character], _ ind: inout Int, _ ch: Character, _ count: Int) {
        chars[ind] = ch
        ind += 1
        guard count > 1 else { return }
        var mult = 10
        while mult <= count {
            mult *= 10
        }
        mult /= 10
        while mult > 0 {
            let char = (count / mult) % 10
            mult /= 10
            chars[ind] = Character("\(char)")
            ind += 1
        }
    }

    func compress(_ chars: inout [Character]) -> Int {
        var f = 1
        var s = 0
        var curCh: Character = chars[0]
        var curCount = 1
        while f < chars.count {
            if chars[f] == curCh {
                curCount += 1
            } else {
                writeIn(&chars, &s, curCh, curCount)
                curCh = chars[f]
                curCount = 1
            }
            f += 1
        }
        writeIn(&chars, &s, curCh, curCount)
        return s
    }
}
