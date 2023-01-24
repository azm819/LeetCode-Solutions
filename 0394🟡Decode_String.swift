private extension Character {
    var digit: Int? {
        switch self {
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
        default: return nil
        }
    }
}

class Solution {
    private func decode(_ chs: [Character]) -> String {
        var result = ""
        var lvl = 0
        var req = [Character]()
        var mult = 0
        for ch in chs {
            if lvl > 0 {
                if ch == "[" {
                    lvl += 1
                } else if ch == "]" {
                    lvl -= 1
                    if lvl == 0 {
                        let reqS = String(decode(req))
                        for _ in 0..<mult {
                            result += reqS
                        }
                        req = []
                        mult = 0
                        continue
                    }
                }
                req.append(ch)
                continue
            }

            if let digit = ch.digit {
                mult = mult * 10 + digit
            } else if ch == "[" {
                lvl += 1
            } else {
                result += String(ch)
            }
        }
        return result
    }

    func decodeString(_ s: String) -> String {
        let chs = Array(s)
        return decode(chs)
    }
}
