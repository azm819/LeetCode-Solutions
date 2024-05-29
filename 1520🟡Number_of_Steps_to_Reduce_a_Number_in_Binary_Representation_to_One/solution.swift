class Solution {
    func numSteps(_ s: String) -> Int {
        var number = Array(s)
        var result = 0
        while number.count > 1 {
            if number.last == "1" {
                while number.last == "1" {
                    number.removeLast()
                    result += 1 // dividing by 2 after switching "1" to "0"
                }
                result += 1 // adding 1
                _ = number.popLast()
                number.append("1")
            } else {
                while number.last == "0" {
                    number.removeLast()
                    result += 1 // dividing by 2
                }
            }
        }
        return result
    }
}
