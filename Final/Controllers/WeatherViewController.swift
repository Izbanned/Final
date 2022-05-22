//
//  WeatherViewController.swift
//  Final
//
//  Created by Dias Karimov on 22.05.2022.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchTextField.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
}
    
    extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            return true
        }
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            if textField.text != "" {
                return true
            } else {
                textField.placeholder = "Type something"
                return false
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let city = searchTextField.text {
                weatherManager.fetchWeather(cityName: city)
            }
            
            searchTextField.text = ""
        }
}
    extension WeatherViewController: WeatherManagerDelegate {
        
        func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
            DispatchQueue.main.async {
                self.temperatureLabel.text = weather.temperatureString
                self.conditionImageView.image = UIImage(systemName: weather.conditionName)
                self.cityLabel.text = weather.cityName
            }
        }
        func didFailtWithError(error: Error) {
            print(error)
        }
    }
    //MARK: - CLLocationManagerDelegate
    extension WeatherViewController: CLLocationManagerDelegate {
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if  let location = locations.last {
                locationManager.stopUpdatingLocation()
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
             weatherManager.fetchWeather(latitude: lat, longitute: lon)
            }
        }
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
        
    }

