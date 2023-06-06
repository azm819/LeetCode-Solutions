class Solution {
    @discardableResult
    private func dfs(
        _ cur: Int,
        _ result: inout Int,
        _ children: [Int: [Int]],
        _ chars: [Character]
    ) -> Int {
        var firstMax = 0
        var secondMax = 0
        for child in children[cur, default: []] {
            let childRes = dfs(child, &result, children, chars)
            if chars[cur] == chars[child] { continue }
            if childRes > firstMax {
                secondMax = firstMax
                firstMax = childRes
            } else if childRes > secondMax {
                secondMax = childRes
            }
        }
        result = max(result, (firstMax + secondMax + 1))
        return firstMax + 1
    }

    func longestPath(_ parent: [Int], _ s: String) -> Int {
        var chars = Array(s)
        var children = [Int: [Int]]()
        for i in 0..<parent.count {
            children[parent[i], default: []].append(i)
        }
        var result = 1
        dfs(0, &result, children, chars)
        return result
    }
}

