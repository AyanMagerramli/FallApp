//
//  BirtdayViewControllerExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.01.24.
//

import Foundation
import UIKit

extension BirthPlaceViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    // MARK: - Picker setup

    func setupCityPicker() {
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityPickerTextField.inputView = cityPicker

        let cityToolbar = createToolbar(with: #selector(cityDoneButtonTapped))
        cityPickerTextField.inputAccessoryView = cityToolbar
        cityPickerTextField.delegate = self
    }

    func setupCountryPicker() {
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryPickerTextField.inputView = countryPicker

        let countryToolbar = createToolbar(with: #selector(countryDoneButtonTapped))
        countryPickerTextField.inputAccessoryView = countryToolbar
        countryPickerTextField.delegate = self
    }

    private func createToolbar(with action: Selector) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: action)
        toolbar.setItems([doneButton], animated: false)
        return toolbar
    }

    // MARK: - UIPickerViewDelegate and UIPickerViewDataSource methods

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker {
            if let cities = self.viewModel.cities?.data {
                return cities.count
            }
        } else if pickerView == countryPicker {
            if let countries = self.viewModel.countries?.data {
                return countries.count
            }
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPicker {
            if let cities = self.viewModel.cities?.data {
                // check if the data is not nill
                let city = cities[row]
                return city.cityName ?? "City Name Not Available"
            }
        } else if pickerView == countryPicker {
            if let countries = self.viewModel.countries?.data {
                // Check if the data is not nil
                let country = countries[row]
                return country.countryName ?? "Country Name Not Available"
            } else {
                return "No Data Available"
            }
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPicker {
            // Make sure the selected row is within the bounds of your data
            if let countries = self.viewModel.countries?.data, row < countries.count {
                // Set the text of the countryPickerTextField to the selected country name
                countryPickerTextField.text = countries[row].countryName ?? "Country Name Not Available"
                self.viewModel.selectedCountry = countryPickerTextField.text
                self.viewModel.countrySelection()
                self.viewModel.downloadCities()
            }
        } else if pickerView == cityPicker {
            if let cities = self.viewModel.cities?.data, row < cities.count {
                // Set the text of the cityPickerTextField to the selected city name
                cityPickerTextField.text = cities[row].cityName ?? "City Name Not Available"
            }
        }
    }

    // MARK: - "Done" button actions

    @objc func cityDoneButtonTapped() {
        cityPickerTextField.resignFirstResponder()
    }

    @objc func countryDoneButtonTapped() {
        countryPickerTextField.resignFirstResponder()
        cityPickerTextField.becomeFirstResponder()
    }
}

