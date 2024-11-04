class Solution {
    func compressedString(_ word: String) -> String {
        var result = ""
        var curCount = 0
        var lastCh: Character?
        for ch in word {
            if ch == lastCh && curCount < 9 {
                curCount += 1
            } else {
                if let lastCh {
                    result += "\(curCount)\(lastCh)"
                }
                lastCh = ch
                curCount = 1
            }
        }


        if let lastCh {
            result += "\(curCount)\(lastCh)"
        }

        return result
    }
}

