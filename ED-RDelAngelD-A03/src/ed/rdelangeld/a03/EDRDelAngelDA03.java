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
public class EDRDelAngelDA03 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Secuencial re = new Secuencial();
        re.setVector(re.randomV(75));
        re.showVector();
        re.showF(re.fetch(114));
        
        System.out.println("-------------------------");
        
        Binaria b = new Binaria ();
        int[] a = {98, 17, 16, 5, 21, 15, 4};
        b.setVector(a);
        b.showVector();
        b.seleccion();
        b.showVector();
        b.showF(b.fetch(21));
        
        System.out.println("-------------------------");
        
        Binaria c = new Binaria();
        int[] d = {39, 17, 78, 5, 15, 10, 7};
        c.setVector(d);
        c.showVector();
        c.insercion();
        c.showVector();
        c.showF(c.fetch(17));
        
        System.out.println("-------------------------");
        
        Binaria e = new Binaria();
        int[] f = {8, 7, 16, 14, 101, 13, 6};
        e.setVector(f);
        e.showVector();
        e.burbuja();
        e.showVector();
        e.showF(e.fetch(16));
        
        System.out.println("-------------------------");
        
        Binaria h = new Binaria();
        int[] g = {178, 35, 6, 17, 21, 19, 22};
        h.setVector(g);
        h.showVector();
        h.quicksort(0, a.length-1);
        h.showVector();
        h.showF(h.fetch(21));
    }
    
}
