class Solution {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        guard k * m <= bloomDay.count else {
            return -1
        }

        var l: Int = .max
        var r: Int = .min
        for day in bloomDay {
            l = min(l, day)
            r = max(r, day)
        }

        while l < r {
            let c = (l + r) / 2
            var flowers = 0
            var bouquets = 0
            for day in bloomDay {
                if day <= c {
                    flowers += 1
                    if flowers == k {
                        bouquets += 1
                        flowers = 0
                        if bouquets >= m {
                            break
                        }
                    }
                } else {
                    flowers = 0
                }
            }

            if bouquets >= m {
                r = c
            } else {
                l = c + 1
            }
        }

        return l
    }
}
