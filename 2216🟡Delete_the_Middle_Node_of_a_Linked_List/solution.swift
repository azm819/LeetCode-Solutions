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
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        var prevMid: ListNode?
        var midL: ListNode?
        var midR = head
        var tail = head
        while true {
            prevMid = midL
            midL = midR
            midR = midR?.next

            tail = tail?.next
            if tail == nil {
                prevMid?.next = midL?.next
                return midL === head ? nil : head
            }

            tail = tail?.next
            if tail == nil {
                midL?.next = midR?.next
                return midR === head ? nil : head
            }
        }
        fatalError()
    }
}
