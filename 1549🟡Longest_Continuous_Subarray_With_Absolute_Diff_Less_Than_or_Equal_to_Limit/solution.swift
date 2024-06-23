private struct Deque<T> {
    private final class Node {
        var value: T
        var next: Node?
        weak var prev: Node?

        init(value: T, next: Node? = nil, prev: Node? = nil) {
            self.value = value
            self.next = next
            self.prev = prev
        }
    }

    private(set) var count: Int = .zero
    private var head: Node?
    private var tail: Node?

    var isEmpty: Bool {
        head == nil && tail == nil
    }

    var front: T? {
        head?.value
    }

    var back: T? {
        tail?.value
    }

    mutating func pushFront(_ value: T) {
        defer {
            count += 1
        }

        let node = Node(value: value)

        if isEmpty {
            head = node
            tail = node
            return
        }

        head?.prev = node
        node.next = head
        head = node
    }

    mutating func pushBack(_ value: T) {
        defer {
            count += 1
        }

        let node = Node(value: value)

        if isEmpty {
            head = node
            tail = node
            return
        }

        tail?.next = node
        node.prev = tail
        tail = node
    }

    @discardableResult
    mutating func popFront() -> T? {
        defer {
            if count == 1 {
                tail = nil
                head = nil
                count = 0
            } else if count > 1 {
                head = head?.next
                head?.prev = nil
                count -= 1
            }
        }

        return head?.value
    }

    @discardableResult
    mutating func popBack() -> T? {
        defer {
            if count == 1 {
                tail = nil
                head = nil
                count = 0
            } else if count > 1 {
                tail = tail?.prev
                tail?.next = nil
                count -= 1
            }
        }

        return tail?.value
    }
}

class Solution {
    func longestSubarray(_ nums: [Int], _ limit: Int) -> Int {
        var minDeque = Deque<Int>()
        var maxDeque = Deque<Int>()
        var result = 0
        var left = 0
        for right in 0 ..< nums.count {
            while let maxBack = maxDeque.back, maxBack < nums[right] {
                maxDeque.popBack()
            }
            maxDeque.pushBack(nums[right])

            while let minBack = minDeque.back, minBack > nums[right] {
                minDeque.popBack()
            }
            minDeque.pushBack(nums[right])

            while maxDeque.front! - minDeque.front! > limit {
                if maxDeque.front == nums[left] {
                    maxDeque.popFront()
                }
                if minDeque.front == nums[left] {
                    minDeque.popFront()
                }
                left += 1
            }

            result = max(result, right - left + 1);
        }

        return result
    }
}

