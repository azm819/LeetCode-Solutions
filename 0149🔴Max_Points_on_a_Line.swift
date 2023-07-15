class Solution {
    private struct Point: Hashable {
        let x: Int
        let y: Int
    }

    private struct Coef: Hashable {
        private struct Fraction: Hashable {
            private let top: Int
            private let bottom: Int

            init(top: Int, bottom: Int) {
                guard bottom != .zero else {
                    self.top = 1
                    self.bottom = 0
                    return
                }
                let isNegative = (top < .zero) != (bottom < .zero)
                var top = abs(top)
                var bottom = abs(bottom)

                if top % bottom == .zero {
                    top /= bottom
                    bottom = 1
                } else if bottom % top == .zero {
                    bottom /= top
                    top = 1
                } else {
                    var k = 2
                    while k * k <= top && k * k <= bottom {
                        if bottom % k == .zero && top % k == .zero {
                            bottom /= k
                            top /= k
                        } else {
                            k += 1
                        }
                    }
                }

                self.top = isNegative ? -top : top
                self.bottom = bottom
            }

            init(_ num: Int) {
                self.top = num
                self.bottom = 1
            }

            static func -(_ lhs: Fraction, _ rhs: Fraction) -> Fraction {
                Fraction(top: lhs.top * rhs.bottom - rhs.top * lhs.bottom, bottom: lhs.bottom * rhs.bottom)
            }

            static func *(_ lhs: Fraction, _ rhs: Int) -> Fraction {
                Fraction(top: lhs.top * rhs, bottom: lhs.bottom)
            }
        }

        private let a: Fraction
        private let b: Fraction

        init(_ lhs: Point, _ rhs: Point) {
            a = Fraction(top: lhs.x - rhs.x, bottom: lhs.y - rhs.y)
            b = Fraction(lhs.x) - a * lhs.y
        }
    }

    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else { return points.count }
        let points = points
            .map { Point(x: $0[0], y: $0[1]) }
            .sorted { (lhs: Point, rhs: Point) in lhs.x < rhs.x || lhs.x == rhs.x && lhs.y < rhs.y }
        var states = [Coef: [Point: Int]]()
        for i in 1..<points.count {
            for j in 0..<i {
                let coef = Coef(points[i], points[j])
                let prevMax = states[coef]?[points[j]] ?? 1
                states[coef]?[points[j]] = nil
                states[coef, default: [:]][points[i]] = prevMax + 1
            }
        }
        return states.values.map { $0.values.max() ?? .zero }.max() ?? 2
    }
}
