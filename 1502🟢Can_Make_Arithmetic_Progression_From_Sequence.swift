class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let arr = arr.sorted()
        let diff = arr[1] - arr[0]
        var ind = 2
        while ind < arr.count {
            if arr[ind] - arr[ind - 1] != diff {
                return false
            }
            ind += 1
        }
        return true
    }
}
