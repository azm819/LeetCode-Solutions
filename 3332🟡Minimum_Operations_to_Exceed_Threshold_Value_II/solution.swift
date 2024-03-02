class Solution {
    private func siftUp(_ ind: Int, _ heap: inout [Int]) {
        let par = (ind - 1) / 2
        if heap[ind] < heap[par] {
            heap.swapAt(ind, par)
            siftUp(par, &heap)
        }
    }

    private func siftDown(_ ind: Int, _ heap: inout [Int]) {
        let left = 2 * ind + 1
        guard left < heap.count else { return }
        let right = 2 * ind + 2
        if right < heap.count {
            if heap[left] < heap[right] {
                if heap[ind] > heap[left] {
                    heap.swapAt(ind, left)
                    siftDown(left, &heap)
                }
            } else {
                if heap[ind] > heap[right] {
                    heap.swapAt(ind, right)
                    siftDown(right, &heap)
                }
            }
        } else {
            if heap[ind] > heap[left] {
                heap.swapAt(ind, left)
                siftDown(left, &heap)
            }
        }
    }

    private func insert(_ key: Int, _ heap: inout [Int]) {
        heap.append(key)
        siftUp(heap.count - 1, &heap)
    }

    private func replaceElement(_ heap: inout [Int], _ ind: Int, _ val: Int) {
        defer {
            heap[ind] = val
            siftDown(ind, &heap)
        }
        guard ind > .zero else { return }
        let par = (ind - 1) / 2
        replaceElement(&heap, par, heap[ind])
    }

    private func popMin(_ heap: inout [Int]) -> Int {
        let minimum = heap[0]
        replaceElement(&heap, heap.count - 1, .max)
        heap.removeLast()
        return minimum
    }

    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var heap = [Int]()
        for num in nums {
            insert(num, &heap)
        }
        while heap.count > 1 {
            let x = popMin(&heap)
            let y = popMin(&heap)
            if x >= k {
                break
            }
            insert(min(x, y) * 2 + max(x, y), &heap)
            result += 1
        }
        return result
    }
}
