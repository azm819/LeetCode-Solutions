class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var res = [Int]()
        for asteroid in asteroids {
            var inserted = false
            let isRightCur = asteroid > .zero
            let absCur = abs(asteroid)
            while !inserted, let last = res.popLast() {
                let isRightLast = last > .zero
                if isRightCur == isRightLast || isRightCur && !isRightLast {
                    res.append(last)
                    res.append(asteroid)
                    inserted = true
                } else if absCur < last {
                    res.append(last)
                    inserted = true
                } else if absCur == last {
                    inserted = true
                }
            }
            if !inserted {
                res.append(asteroid)
            }
        }
        return res
    }
}
