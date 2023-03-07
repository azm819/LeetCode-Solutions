class Solution {
    func minimumTime(_ times: [Int], _ totalTrips: Int) -> Int {
        var l = times[0]
        var r = times[0]
        for time in times {
            l = min(l, time)
            r = max(r, time)
        }
        r *= totalTrips
        var res = r
        while l <= r {
            let c = (l + r) / 2
            var trips = 0
            for time in times {
                let tr = c / time
                trips += tr
                if trips >= totalTrips {
                    break
                }
            }
            if trips < totalTrips {
                l = c + 1
            } else {
                res = min(res, c)
                r = c - 1
            }
        }
        return res
    }
}
