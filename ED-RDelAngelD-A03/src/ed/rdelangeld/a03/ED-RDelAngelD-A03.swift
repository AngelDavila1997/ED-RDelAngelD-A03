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

protocol Ordenamiento{//Es una interface
        func seleccion()
	func insercion()
	func burbuja()
	func quicksort(inicio: Int, final: Int)
	func mergesort(inicio: Int, final: Int)
    }

class Binaria: BusquedaClase, Ordenamiento{{
	func intercambio(i: Int, j: Int){
		let temp = vector[i]
		vector[i] = vector[j]
		vector[j] = temp
	}
	func seleccion() {
		//Declaracion de variables
            var menor = 0
            var a = 0
            for index in 0...vector.count-1{//Ciclo for
                menor=index//menor iguala a la posicion
                for index2 in stride(from: index+1, to: vector.count-1, by: 1){
                    if(vector[index2]<vector[index]){
                        menor=index2
                    }
                }
                    a = vector[index]//se crea una variable auxiliar y se le guarda el valor
                    vector[index] = vector[menor]//al valor del vector se le da el valor menor
                    vector[menor] = a//el valor del vector se guarda en a
            }
        }
	func insercion(){
		var temp: Int
		var j: Int
		for index in stride(from:0, to: vector.count-1, by:1){//Mientras i sea menor al largo del vector
			temp = vector[index]//El valor del vector en la posicion i se guarda en temp
			j = index - 1// En la variable j e guarda el valor de i -1
				while((j >= 0) && (vector[j] > temp)){//Mientras que j sea mayor o igual a0
					                              //Y el valor del vector en la pos j sea mayor que temp
					vector[j+1] = vector[j]
					j-=1
				}
			vector[j+1] = temp
		}
	}
	func burbuja(){
		for _ in stride(from: 1, to: vector.count-1, by:1){
			for index in stride(from: 0, to: vector.count-2, by:1){
				if(vector[index] > vector[index+1]){
					intercambio(i: index, j: index+1)
				}
			}
		}
	}
	func quicksort(inicio: Int, ultimo: Int){
		var i = inicio
		var j = ultimo
		let pivote = vector[((inicio+final)/2)]//Se obtiene el pivote sumando las posiciones inicio y final-inicio
                                                       //del vector entre 2 y el valor de esa posicion se le da a pivote
		repeat{//Equivalente de do
			while(vector[i]<pivote){//Si el valor del vector en la posicion i es menor al pivote
				i+=1//El apuntador avanzara
			}
			while(vector[j]>pivote){//Si el valor del vector en la posicion j es mayor al pivote
				j-=1//El apuntador ira para atras
			}
			if(i<=j){//Si i<=j se realizara el intercambio de valores y se moveran los apuntadores
				intercambio(i: i, j: j)
				i+=1
				j-=1
			}
		}while(i<=j)
		if(inicio<j){//Si el inicio del arreglo es menor que j
			quicksort(inicio: inicio, ultimo:j)//Se enviara un arreglo con estas dos posiciones como parametros
		}
		if(i<ultimo){//Si el i es menor que el final del arreglo
			quicksort(inicio: i, ultimo: ultimo)//Se enviara un arreglo con estas dos posiciones como parametros
		}
	}
	func merge(inicio: Int, medio: Int, ultimo: Int){
		var auxiliar:[Int] = [Int](vector.count)//Se crea un arreglo auxiliar
        	for index in stride(from: 0, to: ultimo, by:1){
            		auxiliar[i] = vector[i]//Se copian ambas partes en el arreglo auxiliar
        	}
        var i = inicio
        var j = medio + 1
        var k = inicio
        // Se copian los valores mas pequeños de, ya sea el lado izq o der hacia el arreglo original
        	while (i <= medio && j <= ultimo) {//Mientras que i sea menor o igual al medio y j sea menor o igual a ultimo
            		if (auxiliar[i] <= auxiliar[j]) {//Si el valor de la posicion i en el arreglo auxiliar
                                            		 //es menor o igual al valor de la posicion j en el mismo arreglo
                		vector[k] = auxiliar[i]//En el vector original se guardara el valor de la pos i del arreglo auxiliar
                		i+=1//i aumenta en 1, osea se mueve el indicador de posicion
            		} else {//Sino
                		vector[k] = auxiliar[j]//En el vector original se guardara el valor de la pos j en el arreglo auxiliar
                		j+=1//j aumenta en 1, y se aumenta el indicador de posicion
            		}
            	k+=1//Aumenta la posicion del arreglo original
        	}
        	//Se copia el resto del arreglo izq en el arreglo original
       		 while (i <= medio) {
           		 vector[k] = auxiliar[i]
           		 k+=1
            		 i+=1
        	}
        // Como ya estamos ordenando, cualquier residuo del lado derecho, ya estan en la posicion correcta
	}
	func mergesort(inicio: Int, ultimo: Int){
		ver medio: Int
		if(inicio < ultimo){//Checa si el inicio es mas pequeño que el ultimo (son numero de posiciones)
            		medio = (inicio + ultimo) / 2//Se obtiene la posicion media
            		//Comienza a dividir el lado izquierdo del arreglo
            		mergesort(inicio, medio)
            		//Comienza a dividir el lado derecho del arreglo
            		mergesort(medio + 1, ultimo)
            		//Se combinan los arreglos
            		merge(inicio, medio, ultimo)
        	}
	}
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
