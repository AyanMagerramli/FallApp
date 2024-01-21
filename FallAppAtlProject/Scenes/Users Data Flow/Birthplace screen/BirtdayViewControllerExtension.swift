//
//  BirtdayViewControllerExtension.swift
//  FallAppAtlProject
//
//  Created by Ayan on 20.01.24.
//

import Foundation
import UIKit

extension BirthCityViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

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
            return cities.count
        } else if pickerView == countryPicker {
            return countries.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPicker {
            return cities[row]
        } else if pickerView == countryPicker {
            return countries[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Handle selection if needed
    }

    // MARK: - "Done" button actions

    @objc func cityDoneButtonTapped() {
        cityPickerTextField.text = cities[cityPicker.selectedRow(inComponent: 0)]
        cityPickerTextField.resignFirstResponder()
    }

    @objc func countryDoneButtonTapped() {
        countryPickerTextField.text = countries[countryPicker.selectedRow(inComponent: 0)]
        countryPickerTextField.resignFirstResponder()
    }
}

