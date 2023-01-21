class Solution {
    private func digit(_ char: Character) -> Int {
        switch char {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        default: return 0
        }
    }

    private func restore(_ digits: [Int], _ ind: Int, _ result: inout [[Int]], _ valid: inout [Bool]) {
        guard ind < digits.count else { return }
        let digit = digits[ind]
        var resA = [[Int]]()
        // print("\(digit)-----------------")
        // print(result)
        // print(valid)
        for i in 0..<result.count where valid[i] {
            let lastInd = result[i].count - 1
            let last = result[i][lastInd]
            if result[i].count < 4 {
                resA.append(result[i] + [digit])
            }
            if last > 100 && digit == 0 || last == 0 {
                valid[i] = false
                continue
            }
            let p = last * 10 + digit
            if p < 256 {
                result[i][lastInd] = p
            } else {
                valid[i] = false
            }
        }
        // print(result)
        // print(valid)
        // print("--")
        // print(resA)
        result += resA
        valid += Array(repeating: true, count: resA.count)
        restore(digits, ind + 1, &result, &valid)
    }

    func restoreIpAddresses(_ s: String) -> [String] {
        let digits = s.map(digit)
        var result = [[digits[0]]]
        var valid = [true]
        restore(digits, 1, &result, &valid)
        var res = [String]()
        for i in 0..<result.count where valid[i] && result[i].count == 4 {
            var r = "\(result[i][0])"
            for j in 1...3 {
                r += ".\(result[i][j])"
            }
            res.append(r)
        }
        return res
    }
}
