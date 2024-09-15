class Solution {
    func findTheLongestSubstring(_ s: String) -> Int {
        var maskToInd: [Int: Int] = [0: -1]
        var curMask = 0
        var curInd = 0
        var result = 0
        for ch in s {
            curMask ^= ch.mask
            if let ind = maskToInd[curMask] {
                result = max(result, curInd - ind)
            } else {
                maskToInd[curMask] = curInd
            }

            curInd += 1
        }

        return result
    }
}

private extension Character {
    var mask: Int {
        switch self {
        case "a":
            return 1 << 0
        case "e":
            return 1 << 1
        case "i":
            return 1 << 2
        case "o":
            return 1 << 3
        case "u":
            return 1 << 4
        default:
            return .zero
        }
    }
}
