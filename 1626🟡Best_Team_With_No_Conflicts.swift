class Solution {
    private struct Player {
        let age: Int
        let score: Int
    }

    func bestTeamScore(_ scores: [Int], _ ages: [Int]) -> Int {
        let players = zip(ages, scores).map(Player.init).sorted { lhs, rhs in
            lhs.score < rhs.score
        }.sorted { lhs, rhs in
            lhs.age < rhs.age
        }
        var dp = Array(repeating: 0, count: scores.count)
        var answer = 0
        for i in 0..<scores.count {
            var j = 0
            while j < i {
                if players[i].score >= players[j].score {
                    dp[i] = max(dp[i], dp[j])
                }
                j += 1
            }
            dp[i] += players[i].score
            answer = max(answer, dp[i])
        }
        return answer
    }
}
