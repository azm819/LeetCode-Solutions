class Solution {
    func lexicalOrder(_ n: Int) -> [Int] {
        var num = 1
        var result = [Int]()
        for _ in 1 ... n {
            result.append(num)

            if num * 10 <= n {
                num *= 10
            } else {
                while num % 10 == 9 || num >= n {
                    num /= 10
                }

                num += 1
            }
        }

        return result
    }
}
