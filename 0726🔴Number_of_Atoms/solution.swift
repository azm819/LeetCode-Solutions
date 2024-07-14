class Solution {
    private func parseCoef(_ index: inout String.Index, _ formula: String) -> Int {
        var coef: Int = .zero
        while index != formula.endIndex, formula[index].isNumber {
            coef = coef * 10 + formula[index].wholeNumberValue!
            index = formula.index(after: index)
        }
        return coef == .zero ? 1 : coef
    }

    private func calcAtomsCount(_ index: inout String.Index, _ formula: String) -> [String: Int] {
        var counts = [String: Int]()
        while index != formula.endIndex {
            switch formula[index] {
            case "(":
                index = formula.index(after: index)
                let subCounts = calcAtomsCount(&index, formula)
                let coef = parseCoef(&index, formula)
                for (atom, count) in subCounts {
                    counts[atom, default: .zero] += count * coef
                }
            case ")":
                index = formula.index(after: index)
                return counts
            case let char where char.isUppercase:
                var atom = String(char)
                index = formula.index(after: index)
                while index != formula.endIndex, formula[index].isLowercase {
                    atom.append(formula[index])
                    index = formula.index(after: index)
                }
                let coef = parseCoef(&index, formula)
                counts[atom, default: .zero] += coef
            default:
                fatalError()
            }
        }

        return counts
    }

    func countOfAtoms(_ formula: String) -> String {
        var index = formula.startIndex
        let counts = calcAtomsCount(&index, formula)
        return counts
            .sorted { $0.key < $1.key }
            .reduce("") { partialResult, atom in
                partialResult + "\(atom.0)" + (atom.1 == 1 ? "" : "\(atom.1)")
            }
    }
}
