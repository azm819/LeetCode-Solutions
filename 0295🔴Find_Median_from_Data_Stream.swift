
class MedianFinder {
    private var median: Double!
    private var needsUpdate = true
    private var nums = [Int]()

    func addNum(_ num: Int) {
        nums.append(num)
        needsUpdate = true
    }

    func findMedian() -> Double {
        updateIfNeeded()
        return median
    }

    private func updateIfNeeded() {
        guard needsUpdate else { return }
        nums.sort()
        let halfInd = nums.count / 2
        if nums.count % 2 == .zero {
            median = (Double(nums[halfInd]) + Double(nums[halfInd - 1])) / 2
        } else {
            median = Double(nums[halfInd])
        }
        needsUpdate = false
    }
}

/**
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
