package model;

import java.util.List;
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

/**
 *
 * @author 
 * Cargar las librerias Rserve y Rengine
 */
public class ConexionR {
    //Devuelve la ruta del archivo creado
    public String conectar(String ruta,String variablesclase,String numeroaproximado) {
         String v2=null;
        try {
            
            int numeroaprox=Integer.parseInt(numeroaproximado);
            RConnection con = new RConnection();
            //Ruta del script 
            con.eval("source(\"C:\\\\Users\\\\cris_\\\\Desktop\\\\Rserve\\\\GenerarDatosExistentes.R\")");
            //Llama al script generar datos y envia el numero de registros a generar la ruta y la variable de clase
            con.eval("f = GenerarDatos("+numeroaprox+",'"+ruta+"', c("+variablesclase+"))");
            //Devuelve el nombre del archivo creado por el script en R
            REXP v = con.eval("as.character(f)");
            v2 = v.asString(); 
          con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return v2;
        
    }
    
    public void test() throws RserveException
    {
        RConnection c = new RConnection();
        c.eval("source(\"C:\\\\Users\\\\crecos\\\\Documents\\\\R\\\\CPBoston.R\")");
    }
}
//            con.eval("d = rnorm(10)");
//            double[] d = con.eval("d").asDoubles();