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
    func middleNode(_ head: ListNode?) -> ListNode? {
        var res: ListNode? = head
        var resInd = 0
        var cur: ListNode? = head
        var curInd = -1
        while cur != nil {
            curInd += 1
            let ind = curInd / 2 + (curInd % 2)
            while resInd < ind {
                res = res?.next
                resInd += 1
            }
            cur = cur?.next
        }
        return res
    }
}
