class Solution {
    private func getNext(_ cur: Int, _ jobInfo: [(Int, Int, Int)]) -> Int {
        let curEndTime = jobInfo[cur].1
        var l = cur + 1
        var r = jobInfo.count - 1

        guard jobInfo[r].0 >= curEndTime else {
            return jobInfo.count
        }

        while l < r {
            let c = (l + r) / 2
            if curEndTime <= jobInfo[c].0 {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }

    private func dp(
        _ cur: Int,
        _ jobInfo: [(Int, Int, Int)],
        _ memo: inout [Int?]
    ) -> Int {
        guard cur < jobInfo.count else { return .zero }
        if let mem = memo[cur] {
            return mem
        }
        let next = getNext(cur, jobInfo)
        let result = max(
            jobInfo[cur].2 + dp(next, jobInfo, &memo),
            dp(cur + 1, jobInfo, &memo)
        )
        memo[cur] = result
        return result
    }

    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        var jobsInfo = [(Int, Int, Int)]()
        for i in 0 ..< startTime.count {
            jobsInfo.append((startTime[i], endTime[i], profit[i]))
        }
        jobsInfo.sort { $0.0 < $1.0 }
        var memo = Array(repeating: Int?.none, count: jobsInfo.count)
        return dp(.zero, jobsInfo, &memo)
    }
}
