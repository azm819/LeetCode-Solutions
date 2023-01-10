class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = [Int]()
        var add = 1
        for i in digits.reversed() {
            let j = i + add
            result.append(j % 10)
            add = j / 10
        }
        if add > 0 {
            result.append(add)
        }
        return result.reversed()
    }
}
