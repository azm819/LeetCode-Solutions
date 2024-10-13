class Solution {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var sortedNums: [(num: Int, group: Int)] = []
        for i in 0 ..< nums.count {
            var result: [(num: Int, group: Int)] = []
            var ind1 = 0
            var ind2 = 0
            while ind1 < sortedNums.count && ind2 < nums[i].count {
                if sortedNums[ind1].num < nums[i][ind2] {
                    result.append(sortedNums[ind1])
                    ind1 += 1
                } else {
                    result.append((nums[i][ind2], i))
                    ind2 += 1
                }
            }

            while ind1 < sortedNums.count {
                result.append(sortedNums[ind1])
                ind1 += 1
            }
            while ind2 < nums[i].count {
                result.append((nums[i][ind2], i))
                ind2 += 1
            }

            sortedNums = result
        }

        var counts: [Int: Int] = [:]
        var resultLeft: Int = .zero
        var resultRight: Int = sortedNums.count - 1
        var left: Int = .zero
        var right: Int = .zero
        while right < sortedNums.count {
            counts[sortedNums[right].group, default: .zero] += 1
            while counts.count == nums.count {
                if sortedNums[resultRight].num - sortedNums[resultLeft].num > sortedNums[right].num - sortedNums[left].num {
                    resultLeft = left
                    resultRight = right
                }

                counts[sortedNums[left].group]! -= 1
                if counts[sortedNums[left].group] == .zero {
                    counts.removeValue(forKey: sortedNums[left].group)
                }
                left += 1
            }

            right += 1
        }

        return [sortedNums[resultLeft].num, sortedNums[resultRight].num]
    }
}
