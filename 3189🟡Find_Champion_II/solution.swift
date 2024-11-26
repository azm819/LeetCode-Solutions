class Solution {
    private func getStrongest(_ team: Int, _ strongestTeams: inout [Int]) -> Int {
        if strongestTeams[team] == team {
            return team
        }

        strongestTeams[team] = getStrongest(strongestTeams[team], &strongestTeams)
        return strongestTeams[team]
    }

    func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
        var strongestTeams = [Int]()
        for team in 0 ..< n {
            strongestTeams.append(team)
        }

        for edge in edges {
            strongestTeams[edge[1]] = getStrongest(edge[0], &strongestTeams)
        }

        var champions = Set<Int>()
        for team in 0 ..< n {
            champions.insert(getStrongest(team, &strongestTeams))
        }

        return champions.count == 1 ? champions.first! : -1
    }
}
