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
        var prev: ListNode?
        var lastVal: Int?
        var cur = head
        while cur != nil {
            if cur?.val != lastVal {
                if result == nil {
                    result = cur
                }
                lastVal = cur?.val
                prev = curRes
                curRes?.next = cur
                curRes = cur
            } else {
                curRes = prev
                if prev == nil {
                    result = nil
                }
            }
            cur = cur?.next
        }
        curRes?.next = nil
        return result
    }
}
