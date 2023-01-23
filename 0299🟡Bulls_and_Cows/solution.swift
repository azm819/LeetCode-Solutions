class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var ind = secret.startIndex
        var bulls = 0
        var cows = 0
        var secMap = [0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0]
        var gueMap = [0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0, 9: 0]
        while ind < secret.endIndex {
            let sec = secret[ind].hexDigitValue!
            let gue = guess[ind].hexDigitValue!
            ind = secret.index(after: ind)
            if sec == gue {
                bulls += 1
                continue
            }
            if let val = secMap[gue], val > 0 {
                cows += 1
                secMap[gue] = val - 1
            } else {
                gueMap[gue] = gueMap[gue]! + 1
            }
            if let val = gueMap[sec], val > 0 {
                cows += 1
                gueMap[sec] = val - 1
                continue
            } else {
                secMap[sec] = secMap[sec]! + 1
            }
        }
        return "\(bulls)A\(cows)B"
    }
}
