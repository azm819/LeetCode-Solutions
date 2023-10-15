class Solution {
    func numWays(_ steps: Int, _ arrLen: Int) -> Int {
        var steps = steps
        var array = Array(repeating: 0, count: arrLen + 1)
        array[0] = 1
        while steps > .zero {
            var oldNum = 0
            for i in 0 ..< arrLen {
                let newNum = (oldNum + array[i] + array[i + 1]) % 1_000_000_007
                oldNum = array[i]
                array[i] = newNum
            }
            steps -= 1
        }
        return array[0]
    }
}
