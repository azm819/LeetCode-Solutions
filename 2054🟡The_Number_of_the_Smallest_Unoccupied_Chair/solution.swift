class Solution {
    private struct Heap<Element> {
        private var heap: [Element] = []
        private let neutralElement: Element
        private let compare: (Element, Element) -> Bool

        var top: Element? {
            heap.first
        }

        init(_ neutralElement: Element, _ compare: @escaping (Element, Element) -> Bool) {
            self.neutralElement = neutralElement
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

            heap[0] = neutralElement
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

    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        let sortedTimes = times.sorted { $0[0] < $1[0] }

        var availableChairs = Heap<Int>(.max, <)
        for i in 0 ..< times.count {
            availableChairs.insert(i)
        }

        var occupiedChairs = Heap<(time: Int, chair: Int)>((.max, .zero)) { $0.time < $1.time }

        for time in sortedTimes {
            while let chair = occupiedChairs.top, chair.time <= time[0] {
                occupiedChairs.popTop()
                availableChairs.insert(chair.chair)
            }

            let chair = availableChairs.popTop()!

            if times[targetFriend] == time {
                return chair
            }

            occupiedChairs.insert((time[1], chair))
        }

        fatalError()
    }
}
