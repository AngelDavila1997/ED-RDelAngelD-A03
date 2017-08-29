/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ed.rdelangeld.a03;

/**
 *
 * @author A01411440
 */
public class Binaria extends BusquedaClase implements Ordenamientos{

    @Override
    int fetch(int n) {//Se escribe dentro del metodo
           int centro, inicio, fin; //Se crean los puntos de referencia para el metodo
           inicio = 0;
           fin = vector.length-1;
           
        while(inicio <= fin){ //Mientras que el valor de inicio sea menor o igual al valor final del arreglo
            centro = (inicio + fin) /2; //Se suman y dividen entre 2 para poder encontrar la posicion central
     
                if(vector[centro] == n){//Si el valor del vector en el centro es igual al valor buscado
                    System.out.println("Realizando busqueda binaria...");
                    return centro; //Se regresa el valor conseguido del centro
                }
                if(n < vector[centro]){ //Si el valor buscado es menor que el valor del vector en el centro
                        fin = centro - 1; //mover final a centro -1
                        }else{
                    inicio = centro + 1; //mover final a centro +1
                }
                }
        System.out.println("Realizando busqueda binaria...");
        return -1; //Regresa una posicion inexistente
        }

    @Override
    public void seleccion() {
        for (int i = 0; i < vector.length-1; i++)//Mientras i sea menor al largo del vector -1
       {
               int menor = i;//La posicion menor se guardara
               for (int j = i + 1; j < vector.length; j++)//Mientras que j sea menor que el largo del vector
               {
                       if (vector[j] < vector[menor])//Si el valor en la posicion j es menor
                       {
                               menor = j;//menor iguala a la posicion j
                       }
               }
               if (i != menor) //si i es diferente de menor
               {
                       intercambio(i, menor);
               }
       }}

    @Override
    public void insercion() {
         for(int i = 1; i < vector.length; i++){//Mientras i sea menor al largo del vector
             int temp = vector[i];//El valor del vector en la posicion i se guarda en temp
             int j = i - 1;// En la variable j e guarda el valor de i -1
                while((j >= 0) && (vector[j] > temp)){//Mientras que j sea mayor o igual a0
                                                        //Y el valor del vector en la pos j sea mayor que temp
                    vector[j+1] = vector[j];
                    j--;
                }
             vector[j+1] = temp;
         }
    }

    @Override
    public void burbuja() {
        for(int i = 1; i < vector.length ; i++){
            for(int j = 0; j < vector.length-1; j++){
                if (vector[j] > vector[j+1]){
                    intercambio(j, j+1);
                }
            }
        }
    }

    @Override
    public void quicksort(int inicio, int ultimo) {
        int i, j, pivote;
        i = inicio;
        j = ultimo;
        pivote = vector[(inicio + ultimo)/2];//Se obtiene el pivote sumando las posiciones inicio y final-inicio
                                                    //del vector entre 2 y el valor de esa posicion se le da a pivote
        do{//Mientras que la condicion de i<=j se cumpla
           while(vector[i] < pivote){//Si el valor del vector en la posicion i es menor al pivote
               i++;//El apuntador avanzara
           }
           while(vector[j] > pivote){//Si el valor del vector en la posicion j es mayor al pivote
               j--;//El apuntador ira para atras
           }
           if(i <= j){//Si i<=j se realizara el intercambio de valores y se moveran los apuntadores
            intercambio(i, j);
            i++;
            j--;
           }
        }while(i <= j);
        
        if(inicio < j){//Si el inicio del arreglo es menor que j
            quicksort(inicio, j); //Se enviara un arreglo con estas dos posiciones como parametros
        }
        if(i < ultimo){//Si el i es menor que el final del arreglo
            quicksort(i, ultimo);//Se enviara un arreglo con estas dos posiciones como parametros
        }
    }

    @Override
    public void mergesort(int inicio, int ultimo) {
        if(inicio < ultimo){//Checa si el inicio es mas pequeño que el ultimo (son numero de posiciones)
            int medio = (inicio + ultimo) / 2;//Se obtiene la posicion media
            //Comienza a dividir el lado izquierdo del arreglo
            mergesort(inicio, medio); 
            //Comienza a dividir el lado derecho del arreglo
            mergesort(medio + 1, ultimo);
            //Se combinan los arreglos
            merge(inicio, medio, ultimo);
        }
    }
    
    public void merge(int inicio, int medio, int ultimo){
        int[] auxiliar = new int[vector.length];//Se crea un arreglo auxiliar
        for(int i = inicio; i <= ultimo; i++){
            auxiliar[i] = vector[i];//Se copian ambas partes en el arreglo auxiliar
        }
        int i = inicio;
        int j = medio + 1;
        int k = inicio;
        // Se copian los valores mas pequeños de, ya sea el lado izq o der hacia el arreglo original
        while (i <= medio && j <= ultimo) {//Mientras que i sea menor o igual al medio y j sea menor o igual a ultimo
            if (auxiliar[i] <= auxiliar[j]) {//Si el valor de la posicion i en el arreglo auxiliar
                                             //es menor o igual al valor de la posicion j en el mismo arreglo
                vector[k] = auxiliar[i];//En el vector original se guardara el valor de la pos i del arreglo auxiliar
                i++;//i aumenta en 1, osea se mueve el indicador de posicion
            } else {//Sino
                vector[k] = auxiliar[j];//En el vector original se guardara el valor de la pos j en el arreglo auxiliar
                j++;//j aumenta en 1, y se aumenta el indicador de posicion
            }
            k++;//Aumenta la posicion del arreglo original
        }
        //Se copia el resto del arreglo izq en el arreglo original
        while (i <= medio) {
            vector[k] = auxiliar[i];
            k++;
            i++;
        }
        // Como ya estamos ordenando, cualquier residuo del lado derecho, ya estan en la posicion correcta
    }
    
    public void intercambio(int i, int j){
        int temp = vector[i];
        vector[i] = vector[j];
        vector[j] = temp;    
    }

}
