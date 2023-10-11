class Solution {
    private func countStartsBinSearch(_ target: Int, _ nums: [Int]) -> Int {
        guard target >= nums[0] else {
            return .zero
        }
        guard target < nums.last! else {
            return nums.count
        }
        var l = 0
        var r = nums.count - 1
        while l < r {
            let c = (l + r + 1) / 2
            if nums[c] <= target {
                l = c
            } else {
                r = c - 1
            }
        }
        return l + 1
    }

    private func countEndsBinSearch(_ target: Int, _ nums: [Int]) -> Int {
        guard target > nums[0] else {
            return .zero
        }
        guard target <= nums.last! else {
            return nums.count
        }
        var l = 0
        var r = nums.count - 1
        while l < r {
            let c = (l + r) / 2
            if nums[c] >= target {
                r = c
            } else {
                l = c + 1
            }
        }
        return l
    }

    func fullBloomFlowers(_ flowers: [[Int]], _ people: [Int]) -> [Int] {
        var starts = [Int]()
        var ends = [Int]()
        for flower in flowers {
            starts.append(flower[0])
            ends.append(flower[1])
        }
        starts.sort()
        ends.sort()
        return people.map { index in
            let startsCount = countStartsBinSearch(index, starts)
            let endsCount = countEndsBinSearch(index, ends)
            return startsCount - endsCount
        }
    }
}
