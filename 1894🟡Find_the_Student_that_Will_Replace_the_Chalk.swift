class Solution {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        var chalkSums = Array(repeating: chalk[0], count: chalk.count)
        var i = 1
        while i < chalk.count {
            chalkSums[i] = chalkSums[i - 1] + chalk[i]
            i += 1
        }
        let k = k % chalkSums.last!
        var l = 0
        var r = chalk.count - 1
        while l < r {
            let c = (l + r) / 2
            if chalkSums[c] > k {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }
}

