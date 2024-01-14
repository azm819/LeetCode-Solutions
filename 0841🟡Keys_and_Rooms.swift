class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var queue = [0]
        var visited = Set(queue)
        while let room = queue.popLast() {
            for key in rooms[room] where visited.insert(key).inserted {
                queue.append(key)
            }
        }
        return visited.count == rooms.count
    }
}

