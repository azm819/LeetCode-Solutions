class ParkingSystem {
    private var big: Int
    private var medium: Int
    private var small: Int


    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.big = big
        self.medium = medium
        self.small = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        switch carType {
        case 1:
            guard big > .zero else { return false }
            big -= 1
        case 2:
            guard medium > .zero else { return false }
            medium -= 1
        default:
            guard small > .zero else { return false }
            small -= 1
        }
        return true
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * let obj = ParkingSystem(big, medium, small)
 * let ret_1: Bool = obj.addCar(carType)
 */
