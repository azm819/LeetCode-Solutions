class Solution {
    func mincostToHireWorkers(_ quality: [Int], _ wage: [Int], _ k: Int) -> Double {
        var workers = [Worker]()
        for i in 0 ..< quality.count {
            workers.append(Worker(quality: quality[i], wage: wage[i]))
        }
        workers.sort { $0.coef < $1.coef }

        var qualitySum = 0
        var result: Double = .greatestFiniteMagnitude
        var heap = [Worker]()
        var heapSize = 0
        for worker in workers {
            insert(worker, &heap)
            heapSize += 1
            qualitySum += worker.quality

            if heapSize > k {
                let minQualityWorker = popMax(&heap)
                heapSize -= 1
                qualitySum -= minQualityWorker.quality
            }

            if heapSize == k {
                result = min(result, worker.coef * Double(qualitySum))
            }
        }

        return result
    }
}

private extension Solution {
    struct Worker {
        let quality: Int
        let wage: Int
        let coef: Double

        init(quality: Int, wage: Int) {
            self.quality = quality
            self.wage = wage
            self.coef = Double(wage) / Double(quality)
        }
    }

    func siftUp(_ ind: Int, _ heap: inout [Worker]) {
        let par = (ind - 1) / 2
        if heap[ind].quality > heap[par].quality {
            heap.swapAt(ind, par)
            siftUp(par, &heap)
        }
    }

    func siftDown(_ ind: Int, _ heap: inout [Worker]) {
        let left = 2 * ind + 1
        guard left < heap.count else { return }
        let right = 2 * ind + 2
        if right < heap.count {
            if heap[left].quality > heap[right].quality {
                if heap[ind].quality < heap[left].quality {
                    heap.swapAt(ind, left)
                    siftDown(left, &heap)
                }
            } else {
                if heap[ind].quality < heap[right].quality {
                    heap.swapAt(ind, right)
                    siftDown(right, &heap)
                }
            }
        } else {
            if heap[ind].quality < heap[left].quality {
                heap.swapAt(ind, left)
                siftDown(left, &heap)
            }
        }
    }

    func insert(_ key: Worker, _ heap: inout [Worker]) {
        heap.append(key)
        siftUp(heap.count - 1, &heap)
    }

    func popMax(_ heap: inout [Worker], _ newHead: Worker = Worker(quality: 0, wage: 1)) -> Worker {
        let maximum = heap[0]
        heap[0] = newHead
        siftDown(.zero, &heap)
        return maximum
    }
}
