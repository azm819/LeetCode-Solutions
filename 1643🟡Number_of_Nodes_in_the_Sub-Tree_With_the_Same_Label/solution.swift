class Solution {

    private func convert(_ char: Character) -> Int {
        switch char {
        case "a": return 0
        case "b": return 1
        case "c": return 2
        case "d": return 3
        case "e": return 4
        case "f": return 5
        case "g": return 6
        case "h": return 7
        case "i": return 8
        case "j": return 9
        case "k": return 10
        case "l": return 11
        case "m": return 12
        case "n": return 13
        case "o": return 14
        case "p": return 15
        case "q": return 16
        case "r": return 17
        case "s": return 18
        case "t": return 19
        case "u": return 20
        case "v": return 21
        case "w": return 22
        case "x": return 23
        case "y": return 24
        case "z": return 25
        default: fatalError()
        }
    }

    @discardableResult
    private func dfs(
        _ n: Int,
        _ cur: Int,
        _ lab: [Int],
        _ children: [Int: [Int]],
        _ result: inout [Int],
        _ visited: inout [Bool]
    ) -> [Int] {
        visited[cur] = true
        var res = Array(repeating: 0, count: 26)
        let curCh = lab[cur]
        res[curCh] = 1
        for child in children[cur, default: []] where !visited[child] {
            let subRes = dfs(n, child, lab, children, &result, &visited)
            for i in 0...25 {
                res[i] += subRes[i]
            }
        }
        result[cur] = res[curCh]
        return res
    }

    func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {
        var children = [Int: [Int]]()
        for edge in edges {
            children[edge[0], default: []].append(edge[1])
            children[edge[1], default: []].append(edge[0])
        }
        var visited = Array(repeating: false, count: n)
        let lab = labels.map { convert($0) }
        var result = Array(repeating: 0, count: n)
        dfs(n, 0, lab, children, &result, &visited)
        return result
    }
}

