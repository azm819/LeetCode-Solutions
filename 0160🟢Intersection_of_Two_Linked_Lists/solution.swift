/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    private func getCount(_ head: ListNode?) -> Int {
        guard var node = head else { return .zero }

        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }

    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        let aCount = getCount(headA)
        let bCount = getCount(headB)
        var curA = headA
        var curB = headB
        if aCount > bCount {
            var diff = aCount - bCount
            while diff > .zero {
                curA = curA?.next
                diff -= 1
            }
        } else if bCount > aCount {
            var diff = bCount - aCount
            while diff > .zero {
                curB = curB?.next
                diff -= 1
            }
        }

        while curA != nil && curB != nil {
            if curA === curB {
                return curA
            }
            curA = curA?.next
            curB = curB?.next
        }
        return nil
    }
}
