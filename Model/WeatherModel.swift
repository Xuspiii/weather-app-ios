import Foundation

struct WeatherModel {
    let city: String
    let weather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    let sunset: Date
    let sunrise: Date
    
    static let empty: WeatherModel = .init(city: "Ciudad no encontrada", weather: "No hay datos", description: "No hay descripción", iconURL: nil, currentTemperature: "0º", minTemperature: "0º", maxTemperature: "0º", humidity: "0%", sunset: .now, sunrise: .now)
}
