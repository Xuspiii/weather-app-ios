import Foundation

struct WeatherModelMapper {
    func mapDataModeltoModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        let temperature = dataModel.temperature
        
        let sunsetWithTimezone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunriseWithTimezone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        
        return WeatherModel(city: dataModel.city, weather: weather.main, description: "(\(weather.description))", iconURL: URL(string: "https://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"), currentTemperature: "\(Int(temperature.currentTemperature))", minTemperature: "\(Int(temperature.minTemperature))", maxTemperature: "\(Int(temperature.maxTemperature))", humidity: "\(temperature.humidity)%", sunset: sunsetWithTimezone, sunrise: sunriseWithTimezone)
    }
}

