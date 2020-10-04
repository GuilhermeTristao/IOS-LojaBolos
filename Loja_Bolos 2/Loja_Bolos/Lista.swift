
//
//  Lista.swift
//  Loja_Bolos
//
//  Created by COTEMIG on 02/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class Lista: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var tableView: UITableView!
    private var bolos : [Bolo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func API()  {
        let url = URL(string: "https://api-bolo.herokuapp.com/bolos")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//             let datateste = data!
//                error == nil,response != nil
//               else{
//                    print("Deu errado")
//                    return
//            }
            print("baixou")
                do{
//                  print(datateste)
                    let decoder = JSONDecoder()
                    let bolos_baixados = try decoder.decode(BolosData.self, from:data!)
                    self.bolos = bolos_baixados.bolos
                   DispatchQueue.main.async {
                     self.tableView.reloadData()
                     print(bolos_baixados.bolos[0].nome)
                     print(bolos_baixados.bolos[0].descricao)
                    }
               }
                catch let error{
                        print(error.localizedDescription)
                }
//                catch let DecodingError.dataCorrupted(context) {     print(context) } catch let DecodingError.keyNotFound(_, context) {     print("Key '(key)' not found:", context.debugDescription);     print("codingPath:", context.codingPath) } catch let DecodingError.valueNotFound(_, context) {     print("Value '(value)' not found:", context.debugDescription);     print("codingPath:", context.codingPath) } catch let DecodingError.typeMismatch(_, context)  {     print("Type '(type)' mismatch:", context.debugDescription);     print("codingPath:", context.codingPath) } catch {     print("error: ", error) }
            }.resume()
          }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int{
        return bolos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "boloCell") as? BolosCell else { return UITableViewCell() }
      
        cell.Nome.text = bolos[indexPath.row].nome
        cell.Descricao.text = bolos[indexPath.row].descricao
        cell.Sabor.text = bolos[indexPath.row].sabor
        cell.Preco.text = bolos[indexPath.row].preco
        
        return cell
    }

}


