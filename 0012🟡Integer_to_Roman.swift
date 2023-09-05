class Solution {
    private static let symbols = [
        (1, "I"),
        (4, "IV"),
        (5, "V"),
        (9, "IX"),
        (10, "X"),
        (40, "XL"),
        (50, "L"),
        (90, "XC"),
        (100, "C"),
        (400, "CD"),
        (500, "D"),
        (900, "CM"),
        (1000, "M"),
    ]

    func intToRoman(_ num: Int) -> String {
        var num = num
        var result = ""
        while num > .zero {
            var l = 0
            var r = Solution.symbols.count - 1
            while l < r {
                let c = (l + r + 1) / 2
                if Solution.symbols[c].0 > num {
                    r = c - 1
                } else {
                    l = c
                }
            }
            num -= Solution.symbols[l].0
            result += Solution.symbols[l].1
        }
        return result
    }
}
