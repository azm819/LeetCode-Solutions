class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var cnt5 = 0
        var cnt10 = 0
        var cnt20 = 0
        for bill in bills {
            switch bill {
            case 5:
                cnt5 += 1
            case 10:
                cnt10 += 1
                guard cnt5 > .zero else { return false }
                cnt5 -= 1
            case 20:
                cnt20 += 1
                if cnt10 > .zero && cnt5 > .zero {
                    cnt10 -= 1
                    cnt5 -= 1
                } else if cnt5 > 2 {
                    cnt5 -= 3
                } else {
                    return false
                }
            default:
                break
            }
        }
        return true
    }
}
