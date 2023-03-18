class BrowserHistory {

    private class Page {
        var next: Page?
        let url: String

        init(url: String) {
            self.url = url
        }
    }

    private var queue: [Page]

    init(_ homepage: String) {
        queue = [Page(url: homepage)]
    }

    func visit(_ url: String) {
        let newPage = Page(url: url)
        queue.last?.next = newPage
        queue.append(newPage)
    }

    func back(_ steps: Int) -> String {
        var steps = steps
        var lastNotNil = queue.last!
        while steps > .zero, let prev = queue.popLast() {
            lastNotNil = prev
            steps -= 1
        }
        if let last = queue.last {
            return last.url
        } else {
            queue.append(lastNotNil)
            return lastNotNil.url
        }
    }

    func forward(_ steps: Int) -> String {
        var steps = steps
        var curNode = queue.last!
        while steps > .zero, let next = curNode.next {
            queue.append(next)
            curNode = next
            steps -= 1
        }
        return curNode.url
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */
