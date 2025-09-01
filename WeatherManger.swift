import Foundation
import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManger {
    let WeatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=cfe7856aacf806b10f575e3518f8e797&units=metric"
    
    
    var delegate: WeatherManagerDelegate?

    
    func fetchWeather(cityName: String){ 
        let urlString = "\(WeatherUrl)&q=\(cityName)"
        performRequest(urlString: urlString)
   
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            
            let session = URLSession(configuration: .default)
            
            
            let task = session.dataTask(with: url) { data, response, error in
                
                
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
        
    }
                
                
                
                func parseJSON(weatherData:Data) {
                    let decoder = JSONDecoder()
                
                    do {
                        let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
                        let weather = WeatherModel(
                       conditonId: decodeData.weather[0].id,
                        CityNmae: decodeData.name,
                        temperature: decodeData.main.temp
                        )
                    self.delegate?.didUpdateWeather(weather)
                    } catch {
                        self.delegate?.didFailWithError(error: error)
                        
                    }
                }
                
            
               
            
        }
        
              

            
            
        
        
        
        
    
    
    






    
    
    
    
    
    
    
    

