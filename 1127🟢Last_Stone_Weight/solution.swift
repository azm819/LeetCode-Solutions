class Solution {
    private func shiftUp(_ ind: Int, _ heap: inout [Int]) {
        let par = (ind - 1) / 2
        if heap[ind] > heap[par] {
            heap.swapAt(ind, par)
            shiftUp(par, &heap)
        }
    }

    private func shiftDown(_ ind: Int, _ heap: inout [Int]) {
        let left = 2 * ind + 1
        guard left < heap.count else { return }
        let right = 2 * ind + 2
        if right < heap.count {
            if heap[left] > heap[right] {
                if heap[ind] < heap[left] {
                    heap.swapAt(ind, left)
                    shiftDown(left, &heap)
                }
            } else {
                if heap[ind] < heap[right] {
                    heap.swapAt(ind, right)
                    shiftDown(right, &heap)
                }
            }
        } else {
            if heap[ind] < heap[left] {
                heap.swapAt(ind, left)
                shiftDown(left, &heap)
            }
        }
    }

    private func insert(_ key: Int, _ heap: inout [Int]) {
        heap.append(key)
        shiftUp(heap.count - 1, &heap)
    }

    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count > 1 else { return stones[0] }
        guard stones.count > 2 else { return abs(stones[0] - stones[1]) }
        var heap = [Int]()
        for stone in stones {
            insert(stone, &heap)
        }
        while true {
            let first = heap[0]
            let secInd = heap[1] > heap[2] ? 1 : 2
            let second = heap[secInd]
            if second == .zero {
                return first
            }
            heap[secInd] = .zero
            shiftDown(secInd, &heap)
            heap[0] = first - second
            shiftDown(0, &heap)
        }
    }
}
