class Solution {
    private struct State: Hashable {
        let nums: [Int]

        static let zero = State(value: .zero)

        var nextStates: [State] {
            var states = [State]()
            for i in 0 ..< nums.count {
                var nums = nums
                nums[i] = (10 + self.nums[i] - 1) % 10
                states.append(State(nums: nums))
                nums[i] = (10 + self.nums[i] + 1) % 10
                states.append(State(nums: nums))
            }
            return states
        }

        init(_ string: String) {
            nums = string.map { $0.wholeNumberValue! }
        }

        init(value: Int, count: Int = 4) {
            nums = Array(repeating: value, count: count)
        }

        init(nums: [Int]) {
            self.nums = nums
        }
    }

    func openLock(_ deadends: [String], _ target: String) -> Int {
        let deadends = deadends.reduce(into: Set<State>()) {
            $0.insert(State($1))
        }
        let targetState = State(target)
        guard !deadends.contains(targetState) && !deadends.contains(.zero) else {
            return -1
        }

        var states: [State] = [.zero]
        var visited = Set<State>(states)
        var steps = 0
        while !states.isEmpty {
            var newStates = [State]()
            for state in states {
                if state == targetState {
                    return steps
                }
                for nextState in state.nextStates where visited.insert(nextState).inserted && !deadends.contains(nextState) {
                    newStates.append(nextState)
                }
            }
            steps += 1
            states = newStates
        }

        return -1
    }
}
