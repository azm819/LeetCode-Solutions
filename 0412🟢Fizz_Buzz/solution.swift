class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var result = Array(repeating: "", count: n)
        var i = 1
        while i <= n {
            switch (i % 3 == 0, i % 5 == 0) {
            case (true, true):
                result[i - 1] = "FizzBuzz"
            case (true, false):
                result[i - 1] = "Fizz"
            case (false, true):
                result[i - 1] = "Buzz"
            case (false, false):
                result[i - 1] = "\(i)"
            }
            i += 1
        }
        return result
    }
}
