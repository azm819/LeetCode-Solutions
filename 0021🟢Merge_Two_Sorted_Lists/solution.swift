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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var f = list1
        var s = list2
        var r: ListNode?
        var curr: ListNode?
        while f != nil || s != nil {
            let fVal = f?.val ?? 101
            let sVal = s?.val ?? 101
            let rVal: Int
            if fVal < sVal {
                f = f?.next
                rVal = fVal
            } else {
                s = s?.next
                rVal = sVal
            }
            if r == nil {
                r = ListNode(rVal)
                curr = r
            } else {
                curr?.next = ListNode(rVal)
                curr = curr?.next
            }
        }
        return r
    }
}
