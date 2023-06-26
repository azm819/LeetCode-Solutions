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

    private func popMin(_ heap: inout [Int], _ newHead: Int = .max) -> Int {
        let minimum = heap[0]
        heap[0] = newHead
        siftDown(.zero, &heap)
        return minimum
    }

    func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
        guard candidates * 2 < costs.count else {
            var heap = [Int]()
            for cost in costs {
                insert(cost, &heap)
            }
            var result = 0
            for _ in 1...k {
                result += popMin(&heap)
            }
            return result
        }
        var result = 0
        var heapL = [Int]()
        var heapR = [Int]()
        var l = candidates - 1
        var r = costs.count - candidates
        for i in 0...l {
            insert(costs[i], &heapL)
        }
        for i in r...costs.count - 1 {
            insert(costs[i], &heapR)
        }

        let takeLeft = {
            var newHead: Int = .max
            l += 1
            if l < r {
                newHead = costs[l]
            }
            result += self.popMin(&heapL, newHead)
        }

        let takeRight = {
            var newHead: Int = .max
            r -= 1
            if l < r {
                newHead = costs[r]
            }
            result += self.popMin(&heapR, newHead)
        }

        for _ in 1...k {
            if heapL.first! <= heapR.first! {
                takeLeft()
            } else {
                takeRight()
            }
        }
        return result
    }
}
