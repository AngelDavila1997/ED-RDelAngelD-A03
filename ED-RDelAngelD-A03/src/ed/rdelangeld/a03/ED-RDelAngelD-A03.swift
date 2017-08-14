//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

import Foundation//Libreria para que funcione la aplicacion

class BusquedaClase {//Clase busqueda
    var vector: [Int] = []
	
    func fetch(n: Int)->Int{//Metodo abstracto(?)
        preconditionFailure("This method must be overridden")
    }
	
    func setVector(v: [Int]){
        self.vector = v
    }
	
    func randomV(n:Int)->[Int]{//Llena el arreglo con numeros aleatorios
        var v:[Int] = [Int]()
        for _ in 0...(n-1) {//Ciclo for
            v.append(Int(arc4random_uniform(125)))//append se usa para añadir 															elementos a arreglos
        }
        return v
    }
	
    func getVector()->[Int]{
        return self.vector
    }
	
    func showVector(){//Muestra el vector
        let count:Int = self.vector.count-1
        var string = "{}"
        for(index) in 0...count{//Para ingresar en un array se necesita "for in"
            string += String(self.vector[index])
        }
        string = String(string.characters.dropLast()) + "}"//Para dejar el ultimo 																elemento dropLast
        print(string)
    }
	
    func showF(n: Int){//Muestra el resultado de la busqueda
        if(n!=(-1)){print("La posicion es:  \(n)")}
        else
        {print("El valor no se encuentra en el arreglo")}
    }
}

class Binaria: BusquedaClase{
    override func fetch(n: Int) -> Int {//Se escribe sobre la func abstracta
        //Se inicializan las variables a usar
		var centro: Int = 0
        var inicio: Int = 0
        var fin: Int = self.vector.count-1
        
        while(inicio <= fin){//Mientras que el valor de inicio sea menor o igual al 								valor final del arreglo
            centro = (inicio + fin) /2 //Se suman y dividen entre 2 para poder 												encontrar la posicion central
            
            if(self.vector[centro] == n){//Si el valor del vector en el centro es 												igual al valor buscado
				print("Realizando busqueda binaria..")
				return centro//Se regresa el valor conseguido del centro
			}
            
            if(n < self.vector[centro]){//Si el valor buscado es menor que el valor 										del vector en el centro
                fin = centro-1//mover final a centro -1
            } else {
                inicio = centro+1//mover final a centro +1
            }
        }
		print("Realizando busqueda binaria..")
        return -1//Regresa una posicion inexistente
    }
}

class Secuencial: BusquedaClase{
    override func fetch(n: Int) -> Int {
        let count:Int = self.vector.count-1
        for i in 0...count{//Ciclo for
            if(self.vector[i]==n){
				print("Realizando busqueda secuencial..")
				return i
			}
			//Si el valor dentro de esa posicion de vector es igual al valor enviado
        }
		print("Realizando busqueda secuencial..")
        return -1//Sino regresara -1 (posicion que no existe)
    }
}

var re: Secuencial = Secuencial()
re.setVector(v: re.randomV(n: 75))
re.showVector()
re.showF(n: re.fetch(n: 114))

var b: Binaria = Binaria()
let a = [1, 3, 5, 7, 9, 11, 13, 15]
b.setVector(a)
b.showVector()
b.showF(b.fetch(3))
