class Solution {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var a = a
        var b = b
        var c = c
        var result = ""
        var last: Character?
        var preLast: Character?
        while a > .zero || b > .zero || c > .zero {
            switch max(a, b, c) {
            case a:
                if last == "a" && preLast == "a" {
                    let maxValue = max(b, c)
                    guard maxValue > .zero else {
                        return result
                    }
                    switch maxValue {
                    case b:
                        result += "b"
                        b -= 1
                    case c:
                        result += "c"
                        c -= 1
                    default:
                        fatalError()
                    }
                } else {
                    result += "a"
                    a -= 1
                }
            case b:
                if last == "b" && preLast == "b" {
                    let maxValue = max(a, c)
                    guard maxValue > .zero else {
                        return result
                    }
                    switch maxValue {
                    case a:
                        result += "a"
                        a -= 1
                    case c:
                        result += "c"
                        c -= 1
                    default:
                        fatalError()
                    }
                } else {
                    result += "b"
                    b -= 1
                }
            case c:
                if last == "c" && preLast == "c" {
                    let maxValue = max(a, b)
                    guard maxValue > .zero else {
                        return result
                    }
                    switch maxValue {
                    case a:
                        result += "a"
                        a -= 1
                    case b:
                        result += "b"
                        b -= 1
                    default:
                        fatalError()
                    }
                } else {
                    result += "c"
                    c -= 1
                }
            default:
                fatalError()
            }

            preLast = last
            last = result.last
        }

        return result
    }
}
