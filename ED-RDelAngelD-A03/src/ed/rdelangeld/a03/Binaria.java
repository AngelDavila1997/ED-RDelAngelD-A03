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
                       int a = vector[i]; //se crea una variable auxiliar y se le guarda el valor del vector en i
                       vector[i] = vector[menor]; //al valor del vector se le da el valor menor
                       vector[menor] = a; //el valor del vector se guarda en a
               }
       }}
    
    @Override
    public void insercion() {
         for(int i = 1; i < vector.length; i++){
             int temp = vector[i];
             int j = i - 1;
                while((j >= 0) && (vector[j] > temp)){
                    vector[j+1] = vector[j];
                    j--;
                }
             vector[j+1] = temp;
         }
    }
    }
