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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var cur = head
        var ind = 0
        var nth: ListNode?
        var old: ListNode?
        var result: ListNode?
        while let curS = cur {
            cur = curS.next
            ind += 1
            if ind == n {
                nth = head
                result = head?.next
            } else if ind > n {
                old = nth
                nth = nth?.next
                result = head
            }
        }
        old?.next = nth?.next
        return result
    }
}
