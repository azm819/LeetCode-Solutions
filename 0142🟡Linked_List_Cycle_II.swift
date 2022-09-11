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
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var f = head
        var s = head
        while f != nil {
            s = s?.next
            f = f?.next?.next
            if f === s {
                f = head
                while s !== f {
                    f = f?.next
                    s = s?.next
                }
                return s
            }
        }
        return nil
    }
}
