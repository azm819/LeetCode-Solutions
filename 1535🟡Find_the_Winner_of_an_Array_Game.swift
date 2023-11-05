class Solution {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var curK = k
        var result = arr[0]
        var ind = 1
        while curK > .zero && ind < arr.count {
            if arr[ind] > result {
                result = arr[ind]
                curK = k - 1
            } else {
                curK -= 1
            }
            ind += 1
        }
        return result
    }
}
