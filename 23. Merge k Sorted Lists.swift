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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var values = [Int]()
        lists.forEach {
            var curr = $0
            while curr != nil {
                values.append(curr!.val)
                curr = curr?.next
            }
        }
        var result: ListNode?
        var current: ListNode?
        values.sort()
        values.forEach {
            if result == nil {
                result = ListNode($0)
                current = result
            } else {
                current?.next = ListNode($0)
                current = current?.next
            }
        }
        return result
    }
}
