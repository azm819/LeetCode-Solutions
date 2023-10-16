class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > .zero else { return [1] }
        var result = [1, 1]
        var rowIndex = rowIndex - 1
        while rowIndex > .zero {
            var oldValue = result[0]
            for i in 1 ..< result.count {
                let newValue = oldValue + result[i]
                oldValue = result[i]
                result[i] = newValue
            }

            result.append(1)
            rowIndex -= 1
        }
        return result
    }
}

