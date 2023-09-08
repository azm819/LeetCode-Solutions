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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var result: ListNode?
        var curRes: ListNode?
        var cur = head
        while cur != nil {
            if curRes?.val != cur?.val {
                if result == nil {
                    result = cur
                }
                curRes?.next = cur
                curRes = cur
            }
            cur = cur?.next
        }
        curRes?.next = nil
        return result
    }
}
