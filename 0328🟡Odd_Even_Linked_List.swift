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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var odd: ListNode?
        var even: ListNode?
        var oddH: ListNode?
        var evenH: ListNode?
        var cur = head
        var curInd = 0
        while cur != nil {
            if curInd % 2 == 0 {
                even?.next = cur
                even = cur
                if evenH == nil {
                    evenH = cur
                }
            } else {
                odd?.next = cur
                odd = cur
                if oddH == nil {
                    oddH = cur
                }
            }
            curInd += 1
            cur = cur?.next
        }
        odd?.next = nil
        even?.next = oddH
        return evenH
    }
}
