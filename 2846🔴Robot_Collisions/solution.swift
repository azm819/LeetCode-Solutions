class Solution {
    private struct Robot {
        enum Direction: Character {
            case left = "L"
            case right = "R"
        }

        let index: Int
        let position: Int
        var health: Int
        let direction: Direction
    }

    func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
        var robots = [Robot]()
        var directionIndex = directions.startIndex
        for i in 0 ..< positions.count {
            robots.append(
                Robot(
                    index: i,
                    position: positions[i],
                    health: healths[i],
                    direction: Robot.Direction(rawValue: directions[directionIndex])!
                )
            )
            directionIndex = directions.index(after: directionIndex)
        }

        robots.sort {
            $0.position < $1.position
        }

        var queue = [Robot]()
        for var robot in robots {
            switch robot.direction {
            case .left:
                var needsInsertion = true
                var isResolved = false
                while !isResolved, var lastRobot = queue.popLast() {
                    switch lastRobot.direction {
                    case .left:
                        queue.append(lastRobot)
                        isResolved = true
                    case .right:
                        if lastRobot.health == robot.health {
                            needsInsertion = false
                            isResolved = true
                        } else if lastRobot.health > robot.health {
                            lastRobot.health -= 1
                            queue.append(lastRobot)
                            needsInsertion = false
                            isResolved = true
                        } else {
                            robot.health -= 1
                        }
                    }
                }

                if needsInsertion {
                    queue.append(robot)
                }
            case .right:
                queue.append(robot)
            }
        }

        return queue.sorted { $0.index < $1.index }.map(\.health)
    }
}
