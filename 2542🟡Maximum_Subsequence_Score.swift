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

    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let nums = zip(nums1, nums2).sorted { $0.1 > $1.1 }
        var heap = [Int]()
        var curSum = 0
        var curMin = nums[0].0
        for i in 0..<k {
            insert(nums[i].0, &heap)
            curSum += nums[i].0
            curMin = min(nums[i].0, curMin)
        }
        var result = nums[k - 1].1 * curSum
        for i in k..<nums.count {
            if curMin == nums[i].0 { continue }
            insert(nums[i].0, &heap)
            curSum += nums[i].0
            curSum -= heap[0]
            heap[0] = .max
            siftDown(.zero, &heap)
            // heap.removeLast()
            curMin = heap[0]

            result = max(result, nums[i].1 * curSum)
        }
        return result
    }
}
