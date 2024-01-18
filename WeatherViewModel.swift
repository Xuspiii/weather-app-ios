import Foundation

final class WeatherViewModel: ObservableObject {
    let API_KEY = ""
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=metric&lang=es")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModeltoModel(dataModel: dataModel)
            }
        } catch {
            self.weatherModel = .empty
        }
    }
}
