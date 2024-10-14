class Solution {
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

    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap<Int>(mapElement: { ($0 + 2) / 3 }, compare: >)

        for num in nums {
            heap.insert(num)
        }

        var result: Int = .zero
        for _ in 1 ... k {
            result += heap.popTop()!
        }

        return result
    }
}

