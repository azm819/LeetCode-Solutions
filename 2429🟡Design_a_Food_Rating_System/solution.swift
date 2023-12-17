class FoodRatings {
    private final class Food {
        let name: String
        let cuisine: String
        var rating: Int

        init(name: String, cuisine: String, rating: Int) {
            self.name = name
            self.cuisine = cuisine
            self.rating = rating
        }
    }

    private let nameToFood: [String: Food]
    private var cuisineToFoods = [String: [Food]]()
    private var needsUpdate = Set<String>()

    init(_ names: [String], _ cuisines: [String], _ ratings: [Int]) {
        var nameToFood = [String: Food]()
        for i in 0 ..< names.count {
            let food = Food(name: names[i], cuisine: cuisines[i], rating: ratings[i])
            nameToFood[food.name] = food
            needsUpdate.insert(food.cuisine)
            cuisineToFoods[food.cuisine, default: []].append(food)
        }
        self.nameToFood = nameToFood
    }

    func changeRating(_ name: String, _ newRating: Int) {
        guard let food = nameToFood[name] else { return }
        food.rating = newRating
        needsUpdate.insert(food.cuisine)
    }

    func highestRated(_ cuisine: String) -> String {
        if needsUpdate.contains(cuisine) {
            cuisineToFoods[cuisine]?.sort { $0.rating > $1.rating || $0.rating == $1.rating && $0.name < $1.name }
            needsUpdate.remove(cuisine)
        }
        return cuisineToFoods[cuisine]!.first!.name
    }
}


/**
 * Your FoodRatings object will be instantiated and called as such:
 * let obj = FoodRatings(foods, cuisines, ratings)
 * obj.changeRating(food, newRating)
 * let ret_2: String = obj.highestRated(cuisine)
 */
