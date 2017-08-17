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
        
        Binaria b = new Binaria ();
        int[] a = {18, 17, 16, 19, 21, 15, 4};
        b.setVector(a);
        b.showVector();
        b.seleccion();
        b.showVector();
        b.showF(b.fetch(21));
    }
    
}
