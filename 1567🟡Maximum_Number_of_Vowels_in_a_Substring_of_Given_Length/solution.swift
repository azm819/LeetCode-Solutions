class Solution {
    private static let vowels = Set<Character>(["a", "e", "i", "o", "u"])

    func maxVowels(_ s: String, _ k: Int) -> Int {
        let arr = Array(s)
        var vowelCnt = 0
        for i in 0..<k {
            if Solution.vowels.contains(arr[i]) {
                vowelCnt += 1
            }
        }
        var result = vowelCnt
        var ind = 0
        while ind < arr.count - k {
            if Solution.vowels.contains(arr[ind]) {
                vowelCnt -= 1
            }
            if Solution.vowels.contains(arr[ind + k]) {
                vowelCnt += 1
            }
            ind += 1
            result = max(result, vowelCnt)
        }
        return result
    }
}

