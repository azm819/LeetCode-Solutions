class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var ind = num.count - 1
        var n = k
        var result = [Int]()
        var add = false
        while ind >= .zero && n > .zero {
            let digit = n % 10 + num[ind] + (add ? 1 : 0)
            add = digit / 10 > .zero
            result.append(digit % 10)
            n /= 10
            ind -= 1
        }
        while ind >= .zero {
            let digit = num[ind] + (add ? 1 : 0)
            add = digit / 10 > .zero
            result.append(digit % 10)
            ind -= 1
        }
        while n > .zero {
            let digit = n % 10 + (add ? 1 : 0)
            add = digit / 10 > .zero
            result.append(digit % 10)
            n /= 10
        }
        if add {
            result.append(1)
        }
        return result.reversed()
    }
}
