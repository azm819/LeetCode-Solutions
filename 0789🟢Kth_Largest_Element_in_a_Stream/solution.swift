class KthLargest {
    private var heap: [Int]

    private let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = []

        for num in nums {
            insert(num, &heap)
        }

        if nums.count > k {
            for _ in 1 ... nums.count - k {
                popMin(&heap)
            }
        }
    }

    func add(_ val: Int) -> Int {
        guard heap.count < k || heap[0] < val else {
            return heap[0]
        }
        
        insert(val, &heap)
        if heap.count > k {
            popMin(&heap)
        }
        return heap[0]
    }
}

private extension KthLargest {
    func siftUp(_ ind: Int, _ heap: inout [Int]) {
        let par = (ind - 1) / 2
        if heap[ind] < heap[par] {
            heap.swapAt(ind, par)
            siftUp(par, &heap)
        }
    }

    func siftDown(_ ind: Int, _ heap: inout [Int]) {
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

    func insert(_ key: Int, _ heap: inout [Int]) {
        heap.append(key)
        siftUp(heap.count - 1, &heap)
    }

    @discardableResult
    func popMin(_ heap: inout [Int], _ newHead: Int = .max) -> Int {
        let maximum = heap[0]
        heap[0] = newHead
        siftDown(.zero, &heap)
        return maximum
    }
}

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
