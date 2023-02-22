private extension Character {
    var int: Int {
        wholeNumberValue ?? .zero
    }
}

class Solution {
    private func sum(_ lhs: String, _ rhs: String) -> String {
        var result = ""
        var lind = lhs.endIndex
        var rind = rhs.endIndex
        var add = false
        while lind > lhs.startIndex && rind > rhs.startIndex {
            lind = lhs.index(before: lind)
            rind = rhs.index(before: rind)
            let dig = lhs[lind].int + rhs[rind].int + (add ? 1 : 0)
            result = "\(dig % 10)\(result)"
            add = dig > 9
        }
        while lind > lhs.startIndex {
            lind = lhs.index(before: lind)
            let dig = lhs[lind].int + (add ? 1 : 0)
            result = "\(dig % 10)\(result)"
            add = dig > 9
        }
        while rind > rhs.startIndex {
            rind = rhs.index(before: rind)
            let dig = rhs[rind].int + (add ? 1 : 0)
            result = "\(dig % 10)\(result)"
            add = dig > 9
        }
        if add {
            result = "1\(result)"
        }
        return result
    }

    private func mult(_ str: String, _ dig: Int) -> String {
        var result = ""
        var ind = str.endIndex
        var add = 0
        while ind > str.startIndex {
            ind = str.index(before: ind)
            var cur = dig * str[ind].int + add
            result = "\(cur % 10)\(result)"
            add = cur / 10
        }
        if add > 0 {
            result = "\(add)\(result)"
        }
        return result
    }

    func multiply(_ num1: String, _ num2: String) -> String {
        guard num1 != "0" && num2 != "0" else {
            return "0"
        }
        var result = ""
        let lhs: String
        let rhs: String
        if num1.count > num2.count {
            lhs = num1
            rhs = num2
        } else {
            lhs = num2
            rhs = num1
        }
        var ind = rhs.endIndex
        var pref = ""
        while ind > rhs.startIndex {
            ind = rhs.index(before: ind)
            let part = mult(lhs, rhs[ind].int) + pref
            result = sum(result, part)
            pref += "0"
        }
        return result
    }
}

