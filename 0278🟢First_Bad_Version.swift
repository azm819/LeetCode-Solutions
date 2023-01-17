/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l <= r {
            let c = (l + r) / 2
            if isBadVersion(c) {
                r = c - 1
            } else {
                if c == n || isBadVersion(c + 1) {
                    return c + 1
                }
                l = c + 1
            }
        }
        return 1
    }
}
