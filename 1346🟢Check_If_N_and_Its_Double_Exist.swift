class Solution {
    private func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let c = (l + r) / 2
            if nums[c] == target {
                return c
            } else if nums[c] < target {
                l = c + 1
            } else {
                r = c - 1
            }
        }
        return -1
    }

    func checkIfExist(_ arr: [Int]) -> Bool {
        let arr = arr.sorted()
        for i in 0..<arr.count {
            let searchRes = search(arr, arr[i] * 2)
            if searchRes != -1 && searchRes != i {
                return true
            }
        }
        return false
    }
}
