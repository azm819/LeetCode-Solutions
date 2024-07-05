/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func nodesBetweenCriticalPoints(_ head: ListNode?) -> [Int] {
        var minDistance: Int = .max
        var maxDistance: Int = .zero
        var curDistance: Int?
        var prev: ListNode?
        var cur = head
        while let node = cur {
            if let prev = prev, let next = node.next, (node.val > prev.val && node.val > next.val || node.val < prev.val && node.val < next.val) {
                if let curDistance = curDistance {
                    minDistance = min(minDistance, curDistance)
                    maxDistance += curDistance
                }

                curDistance = .zero
            }

            prev = node
            cur = node.next
            if curDistance != nil { curDistance! += 1 }
        }

        return minDistance == .max ? [-1, -1] : [minDistance, maxDistance]
    }
}
