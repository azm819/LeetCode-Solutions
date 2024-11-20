class Solution {
    func takeCharacters(_ s: String, _ k: Int) -> Int {
        guard k > .zero else { return .zero }

        let str = Array(s)
        var aCount = 0
        var bCount = 0
        var cCount = 0
        for i in 1 ..< str.count {
            switch str[i] {
            case "a":
                aCount += 1
            case "b":
                bCount += 1
            case "c":
                cCount += 1
            default:
                fatalError()
            }
        }

        var l = 0
        var r = 1
        var result: Int = .max

        while r < str.count && aCount >= k && bCount >= k && cCount >= k {
            result = min(result, str.count - r + l)

            switch str[r] {
            case "a":
                aCount -= 1
            case "b":
                bCount -= 1
            case "c":
                cCount -= 1
            default:
                fatalError()
            }
            r += 1
        }

        while l < r {
            switch str[l] {
            case "a":
                aCount += 1
            case "b":
                bCount += 1
            case "c":
                cCount += 1
            default:
                fatalError()
            }
            l += 1

            while r < str.count && aCount >= k && bCount >= k && cCount >= k {
                result = min(result, str.count - r + l)

                switch str[r] {
                case "a":
                    aCount -= 1
                case "b":
                    bCount -= 1
                case "c":
                    cCount -= 1
                default:
                    fatalError()
                }
                r += 1
            }

            if r == str.count && aCount >= k && bCount >= k && cCount >= k {
                result = min(result, l)
            }
        }

        return result == .max ? -1 : result
    }
}
