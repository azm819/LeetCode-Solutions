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
    func modifiedList(_ nums: [Int], _ head: ListNode?) -> ListNode? {
        let nums = Set(nums)

        var result: ListNode?
        var prevNode: ListNode?
        var curNode = head
        while let node = curNode {
            if !nums.contains(node.val) {
                prevNode?.next = node
                prevNode = node
                result = result ?? node
            }

            curNode = node.next
        }

        prevNode?.next = nil

        return result
    }
}
