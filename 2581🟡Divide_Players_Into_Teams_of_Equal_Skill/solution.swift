class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        let teamSkill = skill.reduce(0, +) * 2 / skill.count
        var unpairedSkills = [Int: Int]()
        var result: Int = .zero
        for playerSkill in skill {
            if playerSkill >= teamSkill {
                return -1
            }

            let pairedSkill = teamSkill - playerSkill
            if let count = unpairedSkills[pairedSkill] {
                unpairedSkills[pairedSkill] = count == 1 ? nil : count - 1
                result += playerSkill * pairedSkill
            } else {
                unpairedSkills[playerSkill, default: .zero] += 1
            }
        }

        return unpairedSkills.isEmpty ? result : -1
    }
}
