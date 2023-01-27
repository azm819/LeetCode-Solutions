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
        var head = head
        var result = [Int]()
        while head != nil {
            result.append(head!.val)
            head = head?.next
        }
        var i = 0
        var j = result.count - 1
        while i < j {
            if result[i] != result[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
