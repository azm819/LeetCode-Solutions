class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted(by: >)
        var left = 0
        var right = people.count - 1
        var result = 0
        while left <= right {
            let secondPer = limit - people[left]
            result += 1
            if left != right && people[right] <= secondPer {
                right -= 1
            }
            left += 1
        }
        return result
    }
}
