import Foundation
// MARK: - FoodResponse
struct FoodResponse: Codable {
    let recipe: Recipe
    let links: Links
    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}
// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}
// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
    let title: String
}
// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let images: Images
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType, mealType, dishType: [String]
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]
}
// MARK: - Digest
struct Digest: Codable {
    let label, tag: String
    let schemaOrgTag: String?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}
enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}
// MARK: - Images
struct Images: Codable {
    let thumbnail, small, regular: Regular
    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
    }
}
// MARK: - Regular
struct Regular: Codable {
    let url: String
    let width, height: Int
}
// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let quantity: Int
    let measure, food: String
    let weight: Double
    let foodCategory, foodID: String
    let image: String
    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}
// MARK: - Total
struct Total: Codable {
    let label: String
    let quantity: Double
    let unit: Unit
}
