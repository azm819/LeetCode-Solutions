class Solution {
    func nthUglyNumber(_ n: Int, _ pows: (twos: Double, threes: Double, fives: Double) = (.zero, .zero, .zero)) -> Int {
        var uglyNumbers = Array(repeating: 0, count: n)
        uglyNumbers[0] = 1

        var indexMultipleOf2 = 0, indexMultipleOf3 = 0, indexMultipleOf5 = 0;
        var nextMultipleOf2 = 2, nextMultipleOf3 = 3, nextMultipleOf5 = 5;

        for i in 1 ..< n {
            let nextUglyNumber = min(nextMultipleOf2, min(nextMultipleOf3, nextMultipleOf5))
            uglyNumbers[i] = nextUglyNumber

            if (nextUglyNumber == nextMultipleOf2) {
                indexMultipleOf2 += 1
                nextMultipleOf2 = uglyNumbers[indexMultipleOf2] * 2
            }
            if (nextUglyNumber == nextMultipleOf3) {
                indexMultipleOf3 += 1
                nextMultipleOf3 = uglyNumbers[indexMultipleOf3] * 3
            }
            if (nextUglyNumber == nextMultipleOf5) {
                indexMultipleOf5 += 1
                nextMultipleOf5 = uglyNumbers[indexMultipleOf5] * 5
            }
        }

        return uglyNumbers[n - 1];
    }
}
