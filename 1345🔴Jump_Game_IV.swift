class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        var edges = [Int: [Int]]()
        for i in 0..<arr.count {
            edges[arr[i], default: .init()].append(i)
        }
        var step = 0
        var curs = [0]
        let req = arr.count - 1
        var visited = Set<Int>()
        while true {
            var newCurs = [Int]()
            while let cur = curs.popLast() {
                if visited.contains(cur) {
                    continue
                }
                visited.insert(cur)
                if cur == req {
                    return step
                }
                if let nodes = edges[arr[cur]] {
                    for node in nodes {
                        newCurs.append(node)
                    }
                    edges[arr[cur]] = nil
                }
                if cur > .zero {
                    newCurs.append(cur - 1)
                }
                if cur < req {
                    newCurs.append(cur + 1)
                }
            }
            curs = newCurs
            step += 1
        }
    }
}
