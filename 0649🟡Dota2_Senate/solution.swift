class Solution {
    func predictPartyVictory(_ senate: String) -> String {
        var queue1 = [Character]()
        var queue2 = [Character]()
        var rCount = 0
        var dCount = 0
        for senator in senate {
            if senator == "R" {
                rCount += 1
            } else {
                dCount += 1
            }
            queue1.append(senator)
        }

        var rBanned = 0
        var dBanned = 0
        while rCount > .zero && dCount > .zero {
            for sen in queue1 {
                if sen == "R" {
                    if rBanned > .zero {
                        rBanned -= 1
                        rCount -= 1
                    } else {
                        queue2.append(sen)
                        dBanned += 1
                    }
                } else {
                    if dBanned > .zero {
                        dBanned -= 1
                        dCount -= 1
                    } else {
                        queue2.append(sen)
                        rBanned += 1
                    }
                }
            }
            queue1.removeAll()
            if rCount == .zero && dCount == .zero { break }
            for sen in queue2 {
                if sen == "R" {
                    if rBanned > .zero {
                        rBanned -= 1
                        rCount -= 1
                    } else {
                        queue1.append(sen)
                        dBanned += 1
                    }
                } else {
                    if dBanned > .zero {
                        dBanned -= 1
                        dCount -= 1
                    } else {
                        queue1.append(sen)
                        rBanned += 1
                    }
                }
            }
            queue2.removeAll()
        }

        return rCount > dCount ? "Radiant" : "Dire"
    }
}

