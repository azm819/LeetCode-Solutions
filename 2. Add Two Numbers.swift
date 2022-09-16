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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var t1 = l1
        var t2 = l2
        var ad = 0
        var absRes: ListNode?
        var res: ListNode?
        while t1 != nil || t2 != nil {
            let sum = (t1?.val ?? .zero) + (t2?.val ?? .zero) + ad
            ad = sum / 10
            if absRes == nil {
                absRes = ListNode(sum % 10)
                res = absRes
            } else {
                res?.next = ListNode(sum % 10)
                res = res?.next
            }

            t1 = t1?.next
            t2 = t2?.next
        }
        if ad == 1 {
            res?.next = ListNode(1)
        }

        return absRes
    }
}
