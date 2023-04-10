/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1
        var r = n
        while l < r {
            let c = (l + r) / 2
            if isBadVersion(c) {
                r = c
            } else {
                l = c + 1
            }
        }
        return r
    }
}
