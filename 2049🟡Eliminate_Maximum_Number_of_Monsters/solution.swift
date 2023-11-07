class Solution {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        var monsters = [(Int, Double)]()
        for i in 0 ..< dist.count {
            monsters.append((i, Double(dist[i]) / Double(speed[i])))
        }
        monsters.sort { $0.1 < $1.1 }

        var time = 0
        var result = 0
        for (monster, _) in monsters {
            if time * speed[monster] >= dist[monster] {
                break
            }
            result += 1
            time += 1
        }
        return result
    }
}

