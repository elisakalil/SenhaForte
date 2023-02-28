import UIKit
import Foundation


//A senha deve iniciar com uma letra maiúscula
func checkPassword(_ password: String?) -> Bool {
    guard let password = password,
          let character = password.first else { return false }
    
    if character.isUppercase  &&
        password.hasOnlyLettersAndNumbers &&
        checkPasswordSize(password) &&
        containsNumber(password) &&
        hasSequency(password) &&
        containsLowercase(password)
    {
        return true
    } else {
        return false
    }
}

//A senha deve ter entre 5 e 15 caracteres
func checkPasswordSize(_ password: String) -> Bool {
    if password.count > 4 && password.count < 16 {
        return true
    } else {
        return false
    }
}

//Pelo menos um número
func containsNumber(_ password: String) -> Bool {
    let decimalCharacter = CharacterSet.decimalDigits
    let decimalRange = password.rangeOfCharacter(from: decimalCharacter)
    
    if decimalRange != nil {
        return true
    }
    
    return false
}

//Pelo menos uma letra minúscula
func containsLowercase(_ password: String) -> Bool {
    let lowercaseCharacter = CharacterSet.lowercaseLetters
    let lowercaseRange = password.rangeOfCharacter(from: lowercaseCharacter)
    
    if lowercaseRange != nil {
        return true
    }
    
    return false
}

//Não pode conter 3 número em sequência
func hasSequency(_ password: String) -> Bool {
    var passed: Bool = true
    
    for (i, char) in password.enumerated() {
        if char.isNumber &&
            password[i - 1].isNumber &&
            password[i - 2].isNumber {
            
            guard let actual = (Int(String(char))),
                  let second = (Int(String(password[i - 1]))),
                  let first = (Int(String(password[i - 2]))) else { return true }
            
            if actual == (second + 1) {
                if actual == (first + 2) {
                    passed = false
                }
            } else {
                passed = true
            }
        }
    }
    return passed
}

//Não pode conter caracteres especiais
extension String {
    var hasOnlyLettersAndNumbers: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789abcdefghijklmnopqrstuvxwyzABCDEFGHIJKLMNOPQRSTUVXWYZ")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
//Extensão pra achar o index através de numero inteiro
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}


print (checkPassword("Guii1nj"))
