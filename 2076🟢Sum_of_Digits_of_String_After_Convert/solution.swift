class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var result: Int = s
            .map(\.letterPosition)
            .flatMap { position in
                if position < 10 {
                    return [position]
                } else {
                    return [position / 10, position % 10]
                }
            }.reduce(0, +)

        var k = k - 1
        while k > .zero && result >= 10 {
            var nextResult: Int = .zero
            while result > .zero {
                nextResult += result % 10
                result /= 10
            }

            result = nextResult
            k -= 1
        }

        return result
    }
}

private extension Character {
    static let aLetter: Character = "a"

    var letterPosition: Int {
        Int(asciiValue! - Character.aLetter.asciiValue!) + 1
    }
}

