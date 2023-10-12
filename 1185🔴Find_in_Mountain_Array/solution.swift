/**
 * // This is MountainArray's API interface.
 * // You should not implement it, or speculate about its implementation
 * interface MountainArray {
 *     public func get(_ index: Int) -> Int {}
 *     public func length() -> Int {}
 * }
 */

class Solution {
    private func binSearch(
        _ left: Int,
        _ leftVal: Int,
        _ right: Int,
        _ rightVal: Int,
        _ target: Int,
        _ mountainArr: MountainArray
    ) -> Int? {
        guard left != right else {
            return leftVal == target ? left : nil
        }
        guard right - left != 1 else {
            if leftVal == target {
                return left
            } else if rightVal == target {
                return right
            } else {
                return nil
            }
        }
        let c = (left + right) / 2
        let val = mountainArr.get(c)
        if leftVal > val {
            if val > target {
                return binSearch(c, val, right, rightVal, target, mountainArr)
            } else {
                return binSearch(left, leftVal, c, val, target, mountainArr)
            }
        } else if rightVal > val {
            if val >= target {
                return binSearch(left, leftVal, c, val, target, mountainArr)
            } else {
                return binSearch(c, val, right, rightVal, target, mountainArr)
            }
        } else {
            return binSearch(left, leftVal, c, val, target, mountainArr) ?? binSearch(c, val, right, rightVal, target, mountainArr)
        }
    }

    func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
        let firstVal = mountainArr.get(0)
        let lastIndex = mountainArr.length() - 1
        let lastVal = mountainArr.get(lastIndex)
        return binSearch(0, firstVal, lastIndex, lastVal, target, mountainArr) ?? -1
    }
}
