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
    func isPalindrome(_ head: ListNode?) -> Bool {
        var cur = head
        var count = 0
        while cur != nil {
            count += 1
            cur = cur?.next
        }

        guard count > 1 else { return true }

        var prev: ListNode?
        cur = head
        var curCount = 0
        while curCount < count / 2 {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
            curCount += 1
        }

        if count % 2 == 1 {
            cur = cur?.next
        }

        while prev != nil && cur != nil {
            if prev?.val != cur?.val {
                return false
            }
            prev = prev?.next
            cur = cur?.next
        }
        return true
    }
}
