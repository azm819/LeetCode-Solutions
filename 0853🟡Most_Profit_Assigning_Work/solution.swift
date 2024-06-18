class Solution {
    func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
        var jobs: [(difficulty: Int, profit: Int)] = zip(difficulty, profit).sorted {
            $0.0 < $1.0
        }

        var maxProfit = 0
        for i in 0 ..< jobs.count {
            maxProfit = max(maxProfit, jobs[i].profit)
            jobs[i].profit = maxProfit
        }

        var result = 0
        for w in worker {
            var l = -1
            var r = jobs.count - 1
            while l < r {
                let m = (l + r + 1) / 2
                if w >= jobs[m].difficulty {
                    l = m
                } else {
                    r = m - 1
                }
            }
            if l != -1 {
                result += jobs[l].profit
            }
        }

        return result
    }
}
