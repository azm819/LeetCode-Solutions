class Solution {
    private enum State {
        case less
        case equal
        case greater
    }

    func isMonotonic(_ nums: [Int]) -> Bool {
        guard nums.count > 1 else { return true }
        var state = State.equal
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                if state == .less {
                    return false
                }
                state = .greater
            } else if nums[i] < nums[i - 1] {
                if state == .greater {
                    return false
                }
                state = .less
            }
        }
        return true
    }
}
