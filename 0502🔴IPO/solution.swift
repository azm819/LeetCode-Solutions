class Solution {
    private struct Project {
        let profit: Int
        let capital: Int
        var notPicked: Bool = true
    }

    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        var result = w
        var k = min(k, profits.count)
        var projects = zip(profits, capital).map { (profit, capital) in
            return Project(profit: profit, capital: capital)
        }.sorted { (lhs: Project, rhs: Project) in
            return lhs.profit > rhs.profit || lhs.profit == rhs.profit && lhs.capital < rhs.capital
        }

        while k > 0 {
            var picked = 0
            for i in 0 ..< projects.count {
                if projects[i].capital <= result && projects[i].notPicked {
                    result += projects[i].profit
                    projects[i].notPicked = false
                    picked += 1
                    if k == picked || picked != i + 1 {
                        break
                    }
                } else if picked > 0 {
                    break
                }
            }
            projects = projects.filter { project in
                project.notPicked
            }
            if picked > 0 {
                k -= picked
            } else {
                return result
            }
        }
        return result
    }
}
