class Solution {
    func findLatestTime(_ s: String) -> String {
        var input = Array(s)
        var H1 = input[0]
        var H2 = input[1]
        var M1 = input[3]
        var M2 = input[4]
        if H1 == "?" {
            if H2 == "?" || H2 == "0" || H2 == "1" {
                H1 = "1"
            } else {
                H1 = "0"
            }
        }
        if H2 == "?" {
            if H1 == "0" {
                H2 = "9"
            } else {
                H2 = "1"
            }
        }
        if M1 == "?" {
            M1 = "5"
        }
        if M2 == "?" {
            M2 = "9"
        }
        return "\(H1)\(H2):\(M1)\(M2)"
    }
}

