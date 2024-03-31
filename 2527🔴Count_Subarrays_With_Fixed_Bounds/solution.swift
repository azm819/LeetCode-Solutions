class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var baseL = 0
        var l = 0
        var r = 0
        var minCount = 0
        var maxCount = 0

        var result = 0
        while r < nums.count {
            if nums[r] < minK || nums[r] > maxK {
                r += 1
                baseL = r
                l = r
                minCount = 0
                maxCount = 0
            } else {
                if nums[r] == minK {
                    minCount += 1
                }
                if nums[r] == maxK {
                    maxCount += 1
                }

                if minCount >= 1 && maxCount >= 1 {
                    while minCount > 1 || maxCount > 1 {
                        if nums[l] == minK {
                            if minCount > 1 {
                                minCount -= 1
                            } else {
                                break
                            }
                        } else if nums[l] == maxK {
                            if maxCount > 1 {
                                maxCount -= 1
                            } else {
                                break
                            }
                        }

                        l += 1
                    }

                    while nums[l] > minK && nums[l] < maxK {
                        l += 1
                    }

                    result += l - baseL + 1
                }

                r += 1
            }
        }

        return result
    }
}
