class SeatManager {
    private var heap: [Int] = []

    init(_ n: Int) {
        for seatNumber in 1 ... n {
            insert(seatNumber, &heap)
        }
    }

    func reserve() -> Int {
        popMin(&heap)
    }

    func unreserve(_ seatNumber: Int) {
        insert(seatNumber, &heap)
    }
}

private extension SeatManager {
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

    func popMin(_ heap: inout [Int], _ newHead: Int = .max) -> Int {
        let minimum = heap[0]
        heap[0] = newHead
        siftDown(.zero, &heap)
        return minimum
    }
}


/**
 * Your SeatManager object will be instantiated and called as such:
 * let obj = SeatManager(n)
 * let ret_1: Int = obj.reserve()
 * obj.unreserve(seatNumber)
 */
