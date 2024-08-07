class Solution {
    private func doubletToWords(_ doublet: Int) -> String {
        switch doublet {
        case 0: return "Zero"
        case 1: return "One"
        case 2: return "Two"
        case 3: return "Three"
        case 4: return "Four"
        case 5: return "Five"
        case 6: return "Six"
        case 7: return "Seven"
        case 8: return "Eight"
        case 9: return "Nine"
        case 10: return "Ten"
        case 11: return "Eleven"
        case 12: return "Twelve"
        case 13: return "Thirteen"
        case 14: return "Fourteen"
        case 15: return "Fifteen"
        case 16: return "Sixteen"
        case 17: return "Seventeen"
        case 18: return "Eighteen"
        case 19: return "Nineteen"
        case 20: return "Twenty"
        case 21 ... 29: return "Twenty \(doubletToWords(doublet % 10))"
        case 30: return "Thirty"
        case 31 ... 39: return "Thirty \(doubletToWords(doublet % 10))"
        case 40: return "Forty"
        case 41 ... 49: return "Forty \(doubletToWords(doublet % 10))"
        case 50: return "Fifty"
        case 51 ... 59: return "Fifty \(doubletToWords(doublet % 10))"
        case 60: return "Sixty"
        case 61 ... 69: return "Sixty \(doubletToWords(doublet % 10))"
        case 70: return "Seventy"
        case 71 ... 79: return "Seventy \(doubletToWords(doublet % 10))"
        case 80: return "Eighty"
        case 81 ... 89: return "Eighty \(doubletToWords(doublet % 10))"
        case 90: return "Ninety"
        case 91 ... 99: return "Ninety \(doubletToWords(doublet % 10))"
        default: return ""
        }
    }

    private func tripletToWords(_ triplet: Int) -> String {
        let hundredCount = triplet / 100

        let doublet = triplet % 100
        if doublet == .zero {
            return "\(doubletToWords(hundredCount)) Hundred"
        } else if hundredCount == .zero {
            return doubletToWords(doublet)
        } else {
            return "\(doubletToWords(hundredCount)) Hundred \(doubletToWords(doublet))"
        }
    }

    func numberToWords(_ num: Int) -> String {
        guard num > .zero else { return "Zero" }

        var chunkNames = ["", "Thousand", "Million", "Billion"]
        var chunkInd = 0

        var result = [String]()
        var num = num
        while num > .zero {
            let triplet = num % 1000
            num /= 1000
            
            if triplet != .zero {
                var tripletWords = tripletToWords(triplet)
                if !chunkNames[chunkInd].isEmpty {
                    tripletWords = "\(tripletWords) \(chunkNames[chunkInd])"
                }
                result.append(tripletWords)
            }

            chunkInd += 1
        }

        return result.reversed().filter { !$0.isEmpty }.joined(separator: " ")
    }
}

