class Solution {
    private func sortArray(_ nums: inout [Int], _ from: Int, _ to: Int) {
        guard from != to else { return }
        guard from + 1 < to else {
            if nums[to] < nums[from] {
                nums.swapAt(from, to)
            }
            return
        }
        let c = (from + to) / 2
        sortArray(&nums, from, c)
        sortArray(&nums, c + 1, to)
        var result = [Int]()
        var f = from
        var s = c + 1
        while f <= c && s <= to {
            if nums[f] > nums[s] {
                result.append(nums[s])
                s += 1
            } else {
                result.append(nums[f])
                f += 1
            }
        }
        while f <= c {
            result.append(nums[f])
            f += 1
        }
        while s <= to {
            result.append(nums[s])
            s += 1
        }
        nums.replaceSubrange(from...to, with: result)
    }

    func sortArray(_ nums: [Int]) -> [Int] {
        var res = nums
        sortArray(&res, 0, res.count - 1)
        return res
    }
}
