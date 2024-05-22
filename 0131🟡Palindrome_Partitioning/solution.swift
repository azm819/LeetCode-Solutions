class Solution {
    private func backtrack(
        _ ind: String.Index,
        _ s: String,
        _ substring: inout [Character],
        _ partition: inout [[Character]],
        _ result: inout [[String]]
    ) {
        guard ind != s.endIndex else {
            if substring.isPolydrome {
                partition.append(substring)
                defer {
                    partition.removeLast()
                }
                result.append(partition.map { String($0) })
            }
            return
        }

        if substring.isPolydrome {
            partition.append(substring)
            defer {
                partition.removeLast()
            }
            var nextSubstring = [s[ind]]
            backtrack(s.index(after: ind), s, &nextSubstring, &partition, &result)
        }

        substring.append(s[ind])
        defer {
            substring.removeLast()
        }
        backtrack(s.index(after: ind), s, &substring, &partition, &result)
    }

    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var substring = [Character]()
        var partition = [[Character]]()
        backtrack(s.startIndex, s, &substring, &partition, &result)
        return result
    }
}

private extension Array where Element == Character {
    var isPolydrome: Bool {
        guard !isEmpty else { return false }
        var a = 0
        var b = count - 1
        while a < b {
            if self[a] != self[b] { return false }
            a += 1
            b -= 1
        }
        return true
    }
}
