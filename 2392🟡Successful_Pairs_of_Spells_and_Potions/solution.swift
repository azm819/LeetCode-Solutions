class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let potions = potions.sorted(by: <)
        let n = potions.count
        var memo = [Int: Int]()
        return spells.map { spell in
            if let res = memo[spell] {
                return res
            }
            var l = 0
            var r = n
            while l < r {
                let c = (l + r) / 2
                if spell * potions[c] < success {
                    l = c + 1
                } else {
                    r = c
                }
            }
            let res = n - l
            memo[spell] = res
            return res
        }
    }
}
