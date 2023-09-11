class Solution {
    func groupThePeople(_ groupSizes: [Int]) -> [[Int]] {
        var groupsMembers = [Int: [Int]]()
        for i in 0 ..< groupSizes.count {
            groupsMembers[groupSizes[i], default: []].append(i)
        }
        var groups = [[Int]]()
        for (size, members) in groupsMembers {
            var group = [Int]()
            for i in 0 ..< members.count {
                group.append(members[i])
                if i % size == size - 1 {
                    groups.append(group)
                    group.removeAll()
                }
            }
        }
        return groups
    }
}
