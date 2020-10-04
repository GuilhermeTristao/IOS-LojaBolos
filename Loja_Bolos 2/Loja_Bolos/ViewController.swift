//
//  ViewController.swift
//  Loja_Bolos
//
//  Created by COTEMIG on 02/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var login: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func entrar(_ sender: Any) {
        let userName = login.text ?? ""
        let userSenha = senha.text ?? ""
        if (userName.isEmpty || userSenha.isEmpty){
        let alertaDeErro = UIAlertController(title: "Login", message: "Falha no Login", preferredStyle: UIAlertController.Style.alert)
            alertaDeErro.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alertaDeErro, animated: true)
        }else{
           
                let loginurl = URL(string: "https://api-bolo.herokuapp.com/login/\(userName)/\(userSenha)")!
                let session = URLSession.shared
                session.dataTask(with: loginurl, completionHandler: { (data, response, error) in
                    DispatchQueue.main.sync {
                    let responsestatus = response as! HTTPURLResponse
                    print(responsestatus.statusCode)
                    if (responsestatus.statusCode == 200) {
                            self.performSegue(withIdentifier: "mostrartela", sender: self)
                    }else {
                        let alertaDeErro = UIAlertController(title: "Login", message: "Erro no Login", preferredStyle: UIAlertController.Style.alert)
                        alertaDeErro.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
                        self.present(alertaDeErro, animated: false)
                        }
                    }}).resume() }
        }
    
    
}

