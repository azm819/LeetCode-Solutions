class Solution {
    func minFlips(_ mat: [[Int]]) -> Int {
        var visited = Set<[[Int]]>()

        var states = [mat]
        var steps = 0
        while !states.isEmpty {
            var newStates = [[[Int]]]()
            for state in states {
                if state.allSatisfy({ row in row.allSatisfy { $0 == .zero } }) {
                    return steps
                }
                for i in 0 ..< state.count {
                    for j in 0 ..< state[i].count {
                        var newState = state

                        newState[i][j] = 1 - newState[i][j]
                        if i > .zero { newState[i - 1][j] = 1 - newState[i - 1][j] }
                        if i + 1 < newState.count { newState[i + 1][j] = 1 - newState[i + 1][j] }
                        if j > .zero { newState[i][j - 1] = 1 - newState[i][j - 1] }
                        if j + 1 < newState[i].count { newState[i][j + 1] = 1 - newState[i][j + 1] }

                        if visited.insert(newState).inserted {
                            newStates.append(newState)
                        }
                    }
                }
            }

            steps += 1
            states = newStates
        }

        return -1
    }
}

