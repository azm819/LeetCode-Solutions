class Solution {
    private struct Skills: OptionSet, Hashable {
        let rawValue: Int

        static let empty = Skills(rawValue: .zero)
    }

    private func dp(
        _ skills: Skills,
        _ peopleSkills: [Skills],
        _ memo: inout [Skills: Set<Int>]
    ) -> Set<Int> {
        if let mem = memo[skills] {
            return mem
        }

        var result = Set<Int>()
        for i in 0..<peopleSkills.count {
            if skills.intersection(peopleSkills[i]) != .empty {
                var subRes = dp(skills.subtracting(peopleSkills[i]), peopleSkills, &memo)
                subRes.insert(i)
                if result.isEmpty || result.count > subRes.count {
                    result = subRes
                }
            }
        }
        memo[skills] = result
        return result
    }

    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        var skillToSet = [String: Skills]()
        var allSkills = Skills()
        for i in 0..<req_skills.count {
            let skill = Skills(rawValue: 1 << i)
            allSkills.insert(skill)
            skillToSet[req_skills[i]] = skill
        }
        var peopleSkills = [Skills]()
        for person in people {
            var personSkills: Skills = .empty
            for skill in person {
                personSkills.insert(skillToSet[skill, default: .empty])
            }
            peopleSkills.append(personSkills)
        }
        var memo = [Skills.empty: Set<Int>()]
        return dp(allSkills, peopleSkills, &memo).sorted()
    }
}

