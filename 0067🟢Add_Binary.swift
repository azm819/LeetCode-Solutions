class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var aInd = a.endIndex
        var bInd = b.endIndex
        var add = false
        var result = ""
        while aInd > a.startIndex && bInd > b.startIndex {
            aInd = a.index(before: aInd)
            bInd = b.index(before: bInd)
            switch (a[aInd], b[bInd]) {
            case ("0", "0"):
                if add {
                    add = false
                    result = "1\(result)"
                } else {
                    result = "0\(result)"
                }
            case ("0", "1"):
                if add {
                    result = "0\(result)"
                } else {
                    result = "1\(result)"
                }
            case ("1", "0"):
                if add {
                    result = "0\(result)"
                } else {
                    result = "1\(result)"
                }
            case ("1", "1"):
                if add {
                    result = "1\(result)"
                } else {
                    add = true
                    result = "0\(result)"
                }
            default:
                break
            }
        }
        while aInd > a.startIndex {
            aInd = a.index(before: aInd)
            switch a[aInd] {
            case "0":
                if add {
                    add = false
                    result = "1\(result)"
                } else {
                    result = "0\(result)"
                }
            case "1":
                if add {
                    result = "0\(result)"
                } else {
                    result = "1\(result)"
                }
            default: break
            }
        }
        while bInd > b.startIndex {
            bInd = b.index(before: bInd)
            switch b[bInd] {
            case "0":
                if add {
                    add = false
                    result = "1\(result)"
                } else {
                    result = "0\(result)"
                }
            case "1":
                if add {
                    result = "0\(result)"
                } else {
                    result = "1\(result)"
                }
            default: break
            }
        }
        if add {
            result = "1\(result)"
        }
        return result
    }
}
