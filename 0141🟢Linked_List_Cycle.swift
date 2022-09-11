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
    func hasCycle(_ head: ListNode?) -> Bool {
        var f = head
        var s = head?.next
        while f != nil && s != nil {
            if f === s {
                return true
            }
            f = f?.next
            s = s?.next?.next
        }
        return false
    }
}
