class Solution {
    private func dp(_ ind: String.Index, _ s: String, _ balance: Int, _ invalidBalances: inout [String.Index: Set<Int>]) -> Bool {
        guard ind != s.endIndex else { return balance == .zero }
        guard balance >= .zero else { return false }

        if invalidBalances[ind]?.contains(balance) ?? false {
            return false
        }

        invalidBalances[ind, default: Set()].insert(balance)

        let nextInd = s.index(after: ind)
        if s[ind] == "(" {
            return dp(nextInd, s, balance + 1, &invalidBalances)
        } else if s[ind] == ")" {
            return dp(nextInd, s, balance - 1, &invalidBalances)
        } else {
            return dp(nextInd, s, balance - 1, &invalidBalances) ||
            dp(nextInd, s, balance, &invalidBalances) ||
            dp(nextInd, s, balance + 1, &invalidBalances)
        }
    }

    func checkValidString(_ s: String) -> Bool {
        var invalidBalances = [String.Index: Set<Int>]()
        return dp(s.startIndex, s, .zero, &invalidBalances)
    }
}

