class Solution {
    private struct Pair: Hashable {
        let u: Int
        let v: Int
        let sum: Int

        func hash(into hasher: inout Hasher) {
            hasher.combine(u)
            hasher.combine(v)
        }
    }

    private func siftUp(_ ind: Int, _ heap: inout [Pair]) {
        let par = (ind - 1) / 2
        if heap[ind].sum < heap[par].sum {
             heap.swapAt(ind, par)
             siftUp(par, &heap)
         }
     }

     private func siftDown(_ ind: Int, _ heap: inout [Pair]) {
         let left = 2 * ind + 1
         guard left < heap.count else { return }
         let right = 2 * ind + 2
         if right < heap.count {
             if heap[left].sum < heap[right].sum {
                 if heap[ind].sum > heap[left].sum {
                     heap.swapAt(ind, left)
                     siftDown(left, &heap)
                 }
             } else {
                 if heap[ind].sum > heap[right].sum {
                     heap.swapAt(ind, right)
                     siftDown(right, &heap)
                 }
             }
         } else {
             if heap[ind].sum > heap[left].sum {
                 heap.swapAt(ind, left)
                 siftDown(left, &heap)
             }
         }
     }

     private func insert(_ key: Pair, _ heap: inout [Pair]) {
         heap.append(key)
         siftUp(heap.count - 1, &heap)
     }

    private func replaceElement(_ heap: inout [Pair], _ ind: Int, _ val: Pair) {
        defer {
            heap[ind] = val
            siftDown(ind, &heap)
        }
        guard ind > .zero else { return }
        let par = (ind - 1) / 2
        replaceElement(&heap, par, heap[ind])
    }

     private func popMin(_ heap: inout [Pair]) -> Pair {
         let minimum = heap[0]
         replaceElement(&heap, heap.count - 1, Pair(u: .zero, v: .zero, sum: .max))
         heap.removeLast()
         return minimum
     }

    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        let firstPair = Pair(u: .zero, v: .zero, sum: nums1[0] + nums2[0])
        var visited = Set<Pair>()
        visited.insert(firstPair)
        var result = [[Int]]()
        var heap = [firstPair]

        while result.count < k && !heap.isEmpty {
            let pair = popMin(&heap)
            result.append([nums1[pair.u], nums2[pair.v]])
            if pair.u + 1 < nums1.count {
                let newPair = Pair(u: pair.u + 1, v: pair.v, sum: nums1[pair.u + 1] + nums2[pair.v])
                if visited.insert(newPair).inserted {
                    insert(newPair, &heap)
                }
            }
            if pair.v + 1 < nums2.count {
                let newPair = Pair(u: pair.u, v: pair.v + 1, sum: nums1[pair.u] + nums2[pair.v + 1])
                if visited.insert(newPair).inserted {
                    insert(newPair, &heap)
                }
            }
        }

        return result
    }
}
