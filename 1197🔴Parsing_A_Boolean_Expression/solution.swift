class Solution {
    private func parseAndCalcExpr(_ expression: String, _ ind: inout String.Index) -> Bool {
        switch expression[ind] {
        case "f":
            ind = expression.index(after: ind)
            return false
        case "t":
            ind = expression.index(after: ind)
            return true
        case "!":
            ind = expression.index(after: ind)
            return parseAndCalcNot(expression, &ind)
        case "&":
            ind = expression.index(after: ind)
            return parseAndCalcAnd(expression, &ind)
        case "|":
            ind = expression.index(after: ind)
            return parseAndCalcOr(expression, &ind)
        default:
            fatalError()
        }
    }

    private func parseAndCalcNot(_ expression: String, _ ind: inout String.Index) -> Bool {
        ind = expression.index(after: ind)
        defer {
            ind = expression.index(after: ind)
        }
        return !parseAndCalcExpr(expression, &ind)
    }

    private func parseAndCalcAnd(_ expression: String, _ ind: inout String.Index) -> Bool {
        var result = true
        while expression[ind] != ")" {
            ind = expression.index(after: ind)
            result = result && parseAndCalcExpr(expression, &ind)

            if result == false {
                var count = 1
                while count > .zero {
                    if expression[ind] == "(" {
                        count += 1
                    } else if expression[ind] == ")" {
                        count -= 1
                    }
                    ind = expression.index(after: ind)
                }

                return false
            }
        }
        ind = expression.index(after: ind)
        return result
    }

    private func parseAndCalcOr(_ expression: String, _ ind: inout String.Index) -> Bool {
        var result = false
        while expression[ind] != ")" {
            ind = expression.index(after: ind)
            result = result || parseAndCalcExpr(expression, &ind)

            if result == true {
                var count = 1
                while count > .zero {
                    if expression[ind] == "(" {
                        count += 1
                    } else if expression[ind] == ")" {
                        count -= 1
                    }
                    ind = expression.index(after: ind)
                }

                return true
            }
        }
        ind = expression.index(after: ind)
        return result
    }

    func parseBoolExpr(_ expression: String) -> Bool {
        var ind = expression.startIndex
        return parseAndCalcExpr(expression, &ind)
    }
}
