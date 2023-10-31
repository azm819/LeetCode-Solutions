class Solution {
    func findArray(_ pref: [Int]) -> [Int] {
        var result = [Int]()
        var prev = 0
        for int in pref {
            result.append(prev ^ int)
            prev = int
        }
        return result
    }
}

