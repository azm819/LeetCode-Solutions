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

    private func isValid(_ heap: [Int], _ ind: Int) -> Bool {
        guard ind < heap.count else { return true }
        let left = 2 * ind + 1
        if left < heap.count && heap[left] > heap[ind] {
            return false
        }
        let right = 2 * ind + 2
        if right < heap.count && heap[right] > heap[ind] {
            return false
        }
        return isValid(heap, left) && isValid(heap, right)
    }

    func lastStoneWeight(_ stones: [Int]) -> Int {
        guard stones.count > 1 else { return stones[0] }
        guard stones.count > 2 else { return abs(stones[0] - stones[1]) }
        var heap = [Int]()
        for stone in stones {
            insert(stone, &heap)
        }
        while true {
            // print(isValid(heap, 0))
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
