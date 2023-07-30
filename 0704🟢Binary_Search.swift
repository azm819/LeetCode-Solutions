class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let c = (left + right) / 2 // индекс «середины» массива
            if nums[c] == target {
                return c
            } else if target < nums[c] {
                right = c - 1 // запускаем binarySearch слева от «середины» массива
            } else if nums[c] < target {
                left = c + 1 // запускаем binarySearch справа от «середины» массива
            }
        }
        return -1
    }
}
