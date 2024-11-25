class Solution {
    private struct State {
        let board: [[Int]]
        let zeroI: Int
        let zeroJ: Int
    }

    private static let boardMoves: [[[Int]]: Int] = {
        var result: [[[Int]]: Int] = [:]
        let initBoard = [[1,2,3],[4,5,0]]
        result[initBoard] = .zero

        let addNextState: (State, Int, Int, Int, inout [State]) -> () = { (state, i, j, moves, newStates) in
            var nextBoard = state.board
            nextBoard[state.zeroI][state.zeroJ] = nextBoard[i][j]
            nextBoard[i][j] = .zero
            if result[nextBoard] == nil {
                result[nextBoard] = moves
                newStates.append(State(board: nextBoard, zeroI: i, zeroJ: j))
            }
        }

        var states: [State] = [State(board: initBoard, zeroI: 1, zeroJ: 2)]
        var moves = 1
        while !states.isEmpty {
            var newStates: [State] = []
            for state in states {
                switch (state.zeroI, state.zeroJ) {
                case (0, 0):
                    addNextState(state, 0, 1, moves, &newStates)
                    addNextState(state, 1, 0, moves, &newStates)
                case (0, 1):
                    addNextState(state, 0, 0, moves, &newStates)
                    addNextState(state, 1, 1, moves, &newStates)
                    addNextState(state, 0, 2, moves, &newStates)
                case (0, 2):
                    addNextState(state, 0, 1, moves, &newStates)
                    addNextState(state, 1, 2, moves, &newStates)
                case (1, 0):
                    addNextState(state, 1, 1, moves, &newStates)
                    addNextState(state, 0, 0, moves, &newStates)
                case (1, 1):
                    addNextState(state, 1, 0, moves, &newStates)
                    addNextState(state, 1, 2, moves, &newStates)
                    addNextState(state, 0, 1, moves, &newStates)
                case (1, 2):
                    addNextState(state, 1, 1, moves, &newStates)
                    addNextState(state, 0, 2, moves, &newStates)
                default:
                    fatalError()
                }
            }

            moves += 1
            states = newStates
        }

        return result
    }()

    func slidingPuzzle(_ board: [[Int]]) -> Int {
        Solution.boardMoves[board] ?? -1
    }
}

