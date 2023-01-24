class Solution {
    private struct Elem {
        let node: Int
        let steps: Int
        let simpleStep: Bool
    }

    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let size = board.count
        var elements = [Int]()
        var flag = true
        for i in 0..<size {
            for j in 0..<size {
                if flag {
                    elements.append(board[size - i - 1][j])
                } else {
                    elements.append(board[size - i - 1][size - j - 1])
                }
            }
            flag.toggle()
        }
        let n = size * size - 1
        var minPathS = Array(repeating: Int.max, count: n + 1)
        var minPathP = Array(repeating: Int.max, count: n + 1)
        var queue = [Elem]()
        for i in 1...6 {
            queue.append(Elem(node: min(i, n), steps: 1, simpleStep: true))
        }
        while !queue.isEmpty {
            let elem = queue.popLast()!
            if elem.simpleStep {
                if minPathS[elem.node] <= elem.steps {
                    continue
                }
                minPathS[elem.node] = elem.steps
                if elem.node == n {
                    continue
                }
                if elements[elem.node] != -1 {
                    queue.append(Elem(node: elements[elem.node] - 1, steps: elem.steps, simpleStep: false))
                } else {
                    for i in 1...6 {
                        queue.append(Elem(node: min(elem.node + i, n), steps: elem.steps + 1, simpleStep: true))
                    }
                }
            } else {
                if minPathP[elem.node] <= elem.steps {
                    continue
                }
                minPathP[elem.node] = elem.steps
                if elem.node == n {
                    continue
                }
                for i in 1...6 {
                    queue.append(Elem(node: min(elem.node + i, n), steps: elem.steps + 1, simpleStep: true))
                }
            }
        }
        let res = min(minPathS[n], minPathP[n])
        return res == Int.max ? -1 : res
    }
}
