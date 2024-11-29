class Solution {
    private struct Position: Hashable {
        let i: Int
        let j: Int
        let time: Int
    }

    private struct Heap<Element> {
        private var heap: [Element] = []
        private let mapElement: (Element) -> Element
        private let compare: (Element, Element) -> Bool

        var top: Element? {
            heap.first
        }

        init(mapElement: @escaping (Element) -> Element, compare: @escaping (Element, Element) -> Bool) {
            self.mapElement = mapElement
            self.compare = compare
        }

        mutating func insert(_ key: Element) {
            heap.append(key)
            shiftUp(heap.count - 1)
        }

        @discardableResult
        mutating func popTop() -> Element? {
            guard let first = heap.first else {
                return nil
            }

            heap[0] = mapElement(first)
            shiftDown(.zero)
            return first
        }

        private mutating func shiftUp(_ ind: Int) {
            let par = (ind - 1) / 2
            if compare(heap[ind], heap[par]) {
                heap.swapAt(ind, par)
                shiftUp(par)
            }
        }

        private mutating func shiftDown(_ ind: Int) {
            let left = 2 * ind + 1
            guard left < heap.count else { return }
            let right = 2 * ind + 2
            if right < heap.count {
                if compare(heap[left], heap[right]) {
                    if !compare(heap[ind], heap[left]) {
                        heap.swapAt(ind, left)
                        shiftDown(left)
                    }
                } else {
                    if !compare(heap[ind], heap[right]) {
                        heap.swapAt(ind, right)
                        shiftDown(right)
                    }
                }
            } else {
                if !compare(heap[ind], heap[left]) {
                    heap.swapAt(ind, left)
                    shiftDown(left)
                }
            }
        }
    }

    func minimumTime(_ grid: [[Int]]) -> Int {
        guard grid[0][0] == 0 && (grid[0][1] <= 1 || grid[1][0] <= 1) else {
            return -1
        }

        var heap = Heap<Position>(
            mapElement: { _ in
                Position(i: .zero, j: .zero, time: .max)
            },
            compare: { lhs, rhs in
                lhs.time < rhs.time
            })
        heap.insert(Position(i: 0, j: 0, time: 0))

        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        while let position = heap.popTop() {
            let i = position.i
            let j = position.j
            guard i >= .zero && i < grid.count && j >= .zero && j < grid[0].count && !visited[i][j] else {
                continue
            }
            visited[i][j] = true

            let time: Int
            if position.time < grid[i][j] {
                time = position.time + (grid[i][j] - position.time + 1) / 2 * 2
            } else {
                time = position.time
            }

            if position.i == grid.count - 1 && position.j == grid[0].count - 1 {
                return time
            }

            heap.insert(Position(i: i + 1, j: j, time: time + 1))
            heap.insert(Position(i: i - 1, j: j, time: time + 1))
            heap.insert(Position(i: i, j: j + 1, time: time + 1))
            heap.insert(Position(i: i, j: j - 1, time: time + 1))
        }

        fatalError()
    }
}
