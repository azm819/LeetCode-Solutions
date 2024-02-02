class Solution {
    private static let sequence: [Int] = {
        var nums = Array(repeating: [Int](), count: 9)
        var num = 12
        var digits = 2
        var power = 100
        while digits <= 9 {
            var trimmedDigits = 0
            var curPower = power
            while trimmedDigits < digits {
                let curDigits = digits - trimmedDigits
                nums[curDigits - 1].append(num % curPower)
                trimmedDigits += 1
                curPower /= 10
            }

            digits += 1
            num = num * 10 + digits
            power *= 10
        }
        return nums.flatMap { $0 }
    }()

    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var result = [Int]()
        for num in Solution.sequence where num >= low {
            if num <= high {
                result.append(num)
            } else {
                break
            }
        }
        return result
    }
}
