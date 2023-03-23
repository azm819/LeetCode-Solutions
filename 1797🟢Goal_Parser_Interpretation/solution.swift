class Solution {
    func interpret(_ command: String) -> String {
        var buf = ""
        var result = ""
        for ch in command {
            if ch == "G" || ch == "(" {
                switch buf {
                case "G":
                    result += "G"
                case "()":
                    result += "o"
                case "(al)":
                    result += "al"
                default:
                    break
                }
                buf = String(ch)
            } else {
                buf.append(ch)
            }
        }
        switch buf {
        case "G":
            result += "G"
        case "()":
            result += "o"
        case "(al)":
            result += "al"
        default:
            break
        }
        return result
    }
}
