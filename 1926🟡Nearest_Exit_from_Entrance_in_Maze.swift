class Solution {
    private struct Position: Hashable {
        let x: Int
        let y: Int
    }

    private func checkStep(
        _ maze: [[Character]],
        _ visited: inout Set<Position>,
        _ queue: inout [Position],
        _ position: Position,
        _ steps: Int
    ) -> Int? {
        guard position.x >= 0 && position.x < maze.count && position.y >= 0 && position.y < maze[0].count else {
            return steps > 0 ? steps : nil
        }
        guard maze[position.x][position.y] != "+" && visited.insert(position).inserted else {
            return nil
        }
        queue.append(position)
        return nil
    }

    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        var queue = [Position(x: entrance[0], y: entrance[1])]
        var visited = Set(queue)
        var steps = 0
        while !queue.isEmpty {
            var newQueue = [Position]()
            for position in queue {
                if let result = checkStep(maze, &visited, &newQueue, Position(x: position.x - 1, y: position.y), steps) {
                    return result
                }
                if let result = checkStep(maze, &visited, &newQueue, Position(x: position.x + 1, y: position.y), steps) {
                    return result
                }
                if let result = checkStep(maze, &visited, &newQueue, Position(x: position.x, y: position.y - 1), steps) {
                    return result
                }
                if let result = checkStep(maze, &visited, &newQueue, Position(x: position.x, y: position.y + 1), steps) {
                    return result
                }
            }
            queue = newQueue
            steps += 1
        }
        return -1
    }
}
