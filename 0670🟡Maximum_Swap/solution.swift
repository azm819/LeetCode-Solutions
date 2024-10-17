class Solution {
    func maximumSwap(_ num: Int) -> Int {
        guard num != .zero else {
            return .zero
        }

        var digits: [Int] = []
        var num = num
        while num > .zero {
            digits.append(num % 10)
            num /= 10
        }

        var firstIndex: Int?
        var secondIndex: Int?
        var currentMaxIndex: Int = .zero
        for i in 0 ..< digits.count {
            if digits[i] < digits[currentMaxIndex] {
                firstIndex = i
                secondIndex = currentMaxIndex
            } else if digits[currentMaxIndex] < digits[i] {
                currentMaxIndex = i
            }
        }

        if let firstIndex, let secondIndex {
            digits.swapAt(firstIndex, secondIndex)
        }

        return digits.reversed().reduce(0) {
            $0 * 10 + $1
        }
    }
}

