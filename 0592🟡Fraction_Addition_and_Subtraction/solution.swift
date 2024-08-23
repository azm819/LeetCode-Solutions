class Solution {
    private struct Fraction: AdditiveArithmetic, CustomStringConvertible {
        static var zero = Fraction(sign: .plus, numerator: .zero, denominator: 1)

        enum Sign: Character {
            case plus = "+"
            case minus = "-"
        }

        let sign: Sign
        let numerator: UInt
        let denominator: UInt

        var description: String {
            switch sign {
            case .plus:
                return "\(numerator)/\(denominator)"
            case .minus:
                return "-\(numerator)/\(denominator)"
            }
        }

        init(sign: Sign?, numerator: UInt, denominator: UInt) {
            self.sign = sign ?? .plus
            var numerator = numerator
            var denominator = denominator
            var divider: UInt = 2
            while divider <= min(numerator, denominator) {
                while numerator % divider == .zero && denominator % divider == .zero {
                    numerator /= divider
                    denominator /= divider
                }
                divider += 1
            }
            self.numerator = numerator
            self.denominator = numerator == .zero ? 1 : denominator
        }

        static func + (lhs: Fraction, rhs: Fraction) -> Fraction {
            switch (lhs.sign, rhs.sign) {
            case (.plus, .plus):
                return Fraction(
                    sign: .plus,
                    numerator: (lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator),
                    denominator: lhs.denominator * rhs.denominator
                )
            case (.plus, .minus):
                return lhs - -rhs
            case (.minus, .plus):
                return rhs - -lhs
            case (.minus, .minus):
                return -lhs + -rhs
            }
        }

        static func - (lhs: Fraction, rhs: Fraction) -> Fraction {
            switch (lhs.sign, rhs.sign) {
            case (.plus, .plus):
                let lDenominator = lhs.numerator * rhs.denominator
                let rDenominator = rhs.numerator * lhs.denominator
                if lDenominator >= rDenominator {
                    return Fraction(
                        sign: .plus,
                        numerator: (lDenominator - rDenominator),
                        denominator: lhs.denominator * rhs.denominator
                    )
                } else {
                    return Fraction(
                        sign: .minus,
                        numerator: (rDenominator - lDenominator),
                        denominator: lhs.denominator * rhs.denominator
                    )
                }
            case (.plus, .minus):
                return lhs + -rhs
            case (.minus, .plus):
                return -(-rhs + lhs)
            case (.minus, .minus):
                return lhs + -rhs
            }
        }

        static prefix func - (operand: Self) -> Self {
            switch operand.sign {
            case .plus:
                Fraction(sign: .minus, numerator: operand.numerator, denominator: operand.denominator)
            case .minus:
                Fraction(sign: .plus, numerator: operand.numerator, denominator: operand.denominator)
            }
        }
    }

    private func parseOperation(
        _ expression: String,
        _ ind: inout String.Index
    ) -> (Fraction, Fraction) -> Fraction {
        defer {
            ind = expression.index(after: ind)
        }
        switch Fraction.Sign(rawValue: expression[ind]) {
        case .plus:
            return { $0 + $1 }
        case .minus:
            return { $0 - $1 }
        case .none:
            fatalError()
        }
    }

    private func parseInteger(
        _ expression: String,
        _ ind: inout String.Index
    ) -> UInt {
        var result: UInt = .zero
        while ind != expression.endIndex && expression[ind].isNumber {
            result *= 10
            result += UInt(expression[ind].wholeNumberValue!)
            ind = expression.index(after: ind)
        }
        return result
    }

    private func parseFraction(
        _ expression: String,
        _ ind: inout String.Index
    ) -> Fraction {
        let sign = Fraction.Sign(rawValue: expression[ind])
        if sign != nil {
            ind = expression.index(after: ind)
        }
        let numerator = parseInteger(expression, &ind)
        ind = expression.index(after: ind)
        let denominator = parseInteger(expression, &ind)
        return Fraction(sign: sign, numerator: numerator, denominator: denominator)
    }

    func fractionAddition(_ expression: String) -> String {
        var ind = expression.startIndex
        var result = parseFraction(expression, &ind)
        while ind != expression.endIndex {
            let operation = parseOperation(expression, &ind)
            let fraction = parseFraction(expression, &ind)
            result = operation(result, fraction)
        }

        return result.description
    }
}
