class Solution {
    private func makePolindrom(_ num: UInt64) -> UInt64 {
        let n = String(num)
        var l = n.startIndex
        var r = n.index(before: n.endIndex)
        var subRes = ""
        while l < r {
            subRes.append(n[l])

            l = n.index(after: l)
            r = n.index(before: r)
        }

        if l == r {
            return UInt64(subRes + String(n[l]) + subRes.reversed())!
        } else {
            return UInt64(subRes + subRes.reversed())!
        }
    }

    func nearestPalindromic(_ n: String) -> String {
        let num = UInt64(n)!

        var lPolin: UInt64 = 0
        var l: UInt64 = 0
        var r: UInt64 = num - 1
        while l <= r {
            let m = l + (r - l) / 2
            let pol = makePolindrom(m)
            if pol < num {
                lPolin = pol
                l = m + 1
            } else {
                r = m - 1
            }
        }

        var rPolin: UInt64 = .max
        l = num + 1
        r = 1_000_000_000_000_000_000 - 1
        while l <= r {
            let m = l + (r - l) / 2
            let pol = makePolindrom(m)
            if pol > num {
                rPolin = pol
                r = m - 1
            } else {
                l = m + 1
            }
        }

        if rPolin - num < num - lPolin {
            return String(rPolin)
        } else {
            return String(lPolin)
        }
    }
}
