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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return nil }
        var count = 1
        var last = head
        while let next = last.next {
            count += 1
            last = next
        }
        let k = k % count
        guard k != .zero else { return head }
        var revK = count - k - 1
        var cur = head
        while revK > .zero, let next = cur.next {
            revK -= 1
            cur = next
        }
        var newHead = cur.next
        cur.next = nil
        last.next = head
        return newHead
    }
}
