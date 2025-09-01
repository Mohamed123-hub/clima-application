

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    var weatherManger = WeatherManger()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        weatherManger.delegate = self
    }
    
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != "" {
            return true
            
        }else {
            textField.placeholder = "Enter city name" //
           return false
        }
        
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManger.fetchWeather(cityName: city)
                
                        searchTextField.text = ""
                        
                        
                        
                    }
                }
            
    func didUpdateWeather(_ weather: WeatherModel) {
            DispatchQueue.main.async {
                self.temperatureLabel.text = weather.temperatureString
                self.cityLabel.text = weather.CityNmae
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            }
        }
        
        func didFailWithError(error: Error) {
            print(error)
        }
            
            
            
            
            
            
        }
        
        
        
        
        
    
    


