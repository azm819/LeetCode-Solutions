class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        var decTeamsCount = Array(repeating: 1, count: rating.count)
        var incTeamsCount = Array(repeating: 1, count: rating.count)

        for _ in 1 ... 2 {
            var newDecTeamsCount = Array(repeating: 0, count: rating.count)
            var newIncTeamsCount = Array(repeating: 0, count: rating.count)
            for i in 0 ..< rating.count - 1 {
                for j in i + 1 ..< rating.count {
                    if rating[i] > rating[j] {
                        newDecTeamsCount[j] += decTeamsCount[i]
                    }
                    if rating[i] < rating[j] {
                        newIncTeamsCount[j] += incTeamsCount[i]
                    }
                }
            }

            decTeamsCount = newDecTeamsCount
            incTeamsCount = newIncTeamsCount
        }

        return decTeamsCount.reduce(0, +) + incTeamsCount.reduce(0, +)
    }
}
