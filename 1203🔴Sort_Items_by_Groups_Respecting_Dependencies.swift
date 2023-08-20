class Solution {
    func sortItems(_ n: Int, _ m: Int, _ group: [Int], _ beforeItems: [[Int]]) -> [Int] {
        var groupItems = Array(repeating: Set<Int>(), count: m)
        var degrees = Array(repeating: 0, count: n)
        for i in 0 ..< group.count where group[i] != -1 {
            groupItems[group[i]].insert(i)
        }

        var groupDegrees = Array(repeating: 0, count: m)
        var parents = [Int: [Int]]()
        for i in 0 ..< beforeItems.count {
            for item in beforeItems[i] {
                parents[item, default: []].append(i)
                degrees[i] += 1
                if group[i] != -1 && group[item] != group[i] {
                    groupDegrees[group[i]] += 1
                }
            }
        }

        var result = [Int]()
        while result.count < n {
            if let freeGroup = groupDegrees.firstIndex(of: .zero) {
                groupDegrees[freeGroup] = -1
                while let freeItem = groupItems[freeGroup].first(where: { degrees[$0] == .zero }) {
                    groupItems[freeGroup].remove(freeItem)
                    result.append(freeItem)
                    degrees[freeItem] = -1
                    for parent in parents[freeItem, default: []] {
                        degrees[parent] -= 1
                        if group[parent] != -1 {
                            groupDegrees[group[parent]] -= 1
                        }
                    }
                }
                if !groupItems[freeGroup].isEmpty {
                    return []
                }
            } else {
                if let freeItem = degrees.enumerated().first(where: { $0.element == .zero && group[$0.offset] == -1 })?.offset {
                    result.append(freeItem)
                    degrees[freeItem] = -1
                    for parent in parents[freeItem, default: []] {
                        degrees[parent] -= 1
                        if group[parent] != -1 {
                            groupDegrees[group[parent]] -= 1
                        }
                    }
                } else {
                    return []
                }
            }
        }

        return result
    }
}
