class Solution {
    func freqAlphabets(_ s: String) -> String {
        let map = [
            1: "a",
            2: "b",
            3: "c",
            4: "d",
            5: "e",
            6: "f",
            7: "g",
            8: "h",
            9: "i",
            10: "j",
            11: "k",
            12: "l",
            13: "m",
            14: "n",
            15: "o",
            16: "p",
            17: "q",
            18: "r",
            19: "s",
            20: "t",
            21: "u",
            22: "v",
            23: "w",
            24: "x",
            25: "y",
            26: "z",
        ]
        var result = ""
        var cur = ""
        for ch in s {
            if ch == "#" {
                var int = Int(cur)!
                cur = ""
                var curRes = map[int % 100]!
                int /= 100
                while int > .zero {
                    curRes = map[int % 10]! + curRes
                    int /= 10
                }
                result += curRes
            } else {
                cur.append(ch)
            }
        }
        if !cur.isEmpty {
            var int = Int(cur)!
            var curRes = ""
            while int > .zero {
                curRes = map[int % 10]! + curRes
                int /= 10
            }
            result += curRes
        }
        return result
    }
}
