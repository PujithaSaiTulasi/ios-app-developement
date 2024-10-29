
//  ViewController.swift
//  WA2_Muddhu_8710
//  Created by Pujitha Sai Tulasi Muddhu on 9/18/24.


import UIKit

class ViewController: UIViewController {
    
    //MARK: declaring the UI elements...
    var basicCalculatorLabel:UILabel!
    var operationsLabel:UILabel!
    var resultLabel:UILabel!
    
    var firstNumberField: UITextField!
    var secondNumberField: UITextField!
    
    var addButton: UIButton!
    var subtractButton: UIButton!
    var multiplyButton: UIButton!
    var divideButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting up UI elements...
        setupBasicCalculatorLabel()
        setupOperationsLabel()
        setupResultLabel()
        
        setupFirstNumberField()
        setupSecondNumberField()
        
        setupAddButton()
        setupSubtractButton()
        setupMultiplyButton()
        setupDivideButton()
        
        //MARK: Adding action to buttons...
        addButton.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)
        subtractButton.addTarget(self, action: #selector(onSubtractButtonTapped), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(onMultiplyButtonTapped), for: .touchUpInside)
        divideButton.addTarget(self, action: #selector(onDivideButtonTapped), for: .touchUpInside)
           
        //MARK: initializing the constraints...
        initConstraints()
    }
    
    //Defining the Label attributes...
    func setupBasicCalculatorLabel(){
        basicCalculatorLabel = UILabel()
        basicCalculatorLabel.text = "Basic Calculator"
        basicCalculatorLabel.font = UIFont.systemFont(ofSize: 24)
        basicCalculatorLabel.textColor = .black
        basicCalculatorLabel.textAlignment = .center
        basicCalculatorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(basicCalculatorLabel)
    }
    
    func setupOperationsLabel(){
        operationsLabel = UILabel()
        operationsLabel.text = "Operations"
        operationsLabel.font = UIFont.systemFont(ofSize: 20)
        operationsLabel.textColor = .black
        operationsLabel.textAlignment = .center
        operationsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(operationsLabel)
    }
    
    func setupResultLabel(){
        resultLabel = UILabel()
        resultLabel.text = "Result"
        resultLabel.font = UIFont.boldSystemFont(ofSize: 20)
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
    }
    
    
    //Defining the TextField attributes...
    func setupFirstNumberField(){
        firstNumberField = UITextField()
        firstNumberField.placeholder = "First number"
        firstNumberField.borderStyle = .roundedRect
        firstNumberField.keyboardType = .decimalPad
        firstNumberField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstNumberField)
    }
    
    func setupSecondNumberField(){
        secondNumberField = UITextField()
        secondNumberField.placeholder = "Second number"
        secondNumberField.borderStyle = .roundedRect
        secondNumberField.keyboardType = .decimalPad
        secondNumberField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondNumberField)
    }
    
    
    //Defining the Button attributes...
    func setupAddButton(){
        addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.tintColor = .systemBlue
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
    }
    
    func setupSubtractButton(){
        subtractButton = UIButton(type: .system)
        subtractButton.setTitle("Subtract", for: .normal)
        subtractButton.tintColor = .systemBlue
        subtractButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtractButton)
    }
    
    func setupMultiplyButton(){
        multiplyButton = UIButton(type: .system)
        multiplyButton.setTitle("Multiply", for: .normal)
        multiplyButton.tintColor = .systemBlue
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(multiplyButton)
    }
    
    func setupDivideButton(){
        divideButton = UIButton(type: .system)
        divideButton.setTitle("Divide", for: .normal)
        divideButton.tintColor = .systemBlue
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(divideButton)
    }
    
    //MARK: Initializing the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate(
            [
                //MARK: constraints for labelHello...
                basicCalculatorLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                basicCalculatorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                operationsLabel.topAnchor.constraint(equalTo: secondNumberField.bottomAnchor, constant: 30),
                operationsLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                resultLabel.topAnchor.constraint(equalTo: divideButton.bottomAnchor, constant: 30),
                resultLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                //MARK: constraints for textFieldUser...
                firstNumberField.topAnchor.constraint(equalTo: basicCalculatorLabel.bottomAnchor, constant: 30),
                firstNumberField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                secondNumberField.topAnchor.constraint(equalTo: firstNumberField.bottomAnchor, constant: 30),
                secondNumberField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                //MARK: constraints for buttonClickMe...
                addButton.topAnchor.constraint(equalTo: operationsLabel.bottomAnchor, constant: 30),
                addButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                subtractButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 30),
                subtractButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                multiplyButton.topAnchor.constraint(equalTo: subtractButton.bottomAnchor, constant: 30),
                multiplyButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                
                divideButton.topAnchor.constraint(equalTo: multiplyButton.bottomAnchor, constant: 30),
                divideButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ]
        )
    }
    
    // MARK: Button Tapped Actions...
    @objc func onAddButtonTapped() {
        performOperation(operation: "+")
    }
    
    @objc func onSubtractButtonTapped() {
        performOperation(operation: "-")
    }
    
    @objc func onMultiplyButtonTapped() {
        performOperation(operation: "*")
    }
    
    @objc func onDivideButtonTapped() {
        performOperation(operation: "/")
    }
    
    // MARK: Performing the operation and showing the result...
    func performOperation(operation: String) {
        // Check if any TextField is empty
        guard let firstText = firstNumberField.text, !firstText.isEmpty,
              let secondText = secondNumberField.text, !secondText.isEmpty else {
            showErrorAlert(message: "Error! The numbers cannot be empty!")
            return
        }
        
        // Validate if the input is a valid number
        guard let firstNumber = Double(firstText), let secondNumber = Double(secondText) else {
            showErrorAlert(message: "Error! Please enter valid numbers.")
            return
        }
        
        var result: Double = 0
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "/":
            if secondNumber != 0 {
                result = firstNumber / secondNumber
            } else {
                showErrorAlert(message: "Error! Division by zero is not allowed!")
                return
            }
        default:
            break
        }
        
        let formattedResult = formatNumber(result)
        resultLabel.text = "\(formattedResult)"
    }
    
    // MARK: Format number to 2 decimal places and remove trailing zeros...
    func formatNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    // MARK: Showing Error Alert...
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}


