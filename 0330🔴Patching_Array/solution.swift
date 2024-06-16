class Solution {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var currentMax = 0
        var patches = 0

        var ind = 0
        while ind < nums.count && currentMax < n {
            let num: Int
            if currentMax + 1 < nums[ind] {
                num = currentMax + 1
                patches += 1
            } else {
                num = nums[ind]
                ind += 1
            }

            currentMax += num
        }

        while currentMax < n {
            patches += 1
            currentMax += currentMax + 1
        }

        return patches
    }
}
