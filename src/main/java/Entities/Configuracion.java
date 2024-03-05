package Entities;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class Configuracion {

  private String url;
  private String proxyHost;
  private String proxyPort;
  private String proxyUsername;
  private String proxyPassword;
  private String nombreCarpetaDestino;
  private String usoProxy;

  public void cargarConfiguracion() {

    Properties propiedades = new Properties();

    String archivoConfiguracion = System.getProperty("user.dir") + File.separator + "config.properties";

    try (InputStream input =  new FileInputStream(archivoConfiguracion)) {

      if (input == null) {
        System.err.println("Lo siento, no se pudo encontrar el archivo de configuración: " + archivoConfiguracion);

      }

      propiedades.load(input);

      // Obtener las configuraciones desde el archivo propiedades

      this.url = propiedades.getProperty("url");

      this.proxyHost = propiedades.getProperty("proxyHost");

      this.proxyPort = propiedades.getProperty("proxyPort");

      this.proxyUsername = propiedades.getProperty("proxyUsername");

      this.proxyPassword = propiedades.getProperty("proxyPassword");

      this.nombreCarpetaDestino= propiedades.getProperty("nombreCarpetaDestino");

      this.usoProxy=propiedades.getProperty("usoProxy");

    } catch (IOException ex) {

      System.err.println("Error al cargar el archivo de configuración: " + ex.getMessage());

    }
  }

  public String getURL(){
    return this.url;
  }
  public String getProxyHost(){
    return this.proxyHost;
  }
  public String getProxyPort(){
    return this.proxyPort;
  }
  public String getProxyUsername(){
    return this.proxyUsername;
  }
  public String getProxyPassword(){
    return this.proxyPassword;
  }
  public String getNombreCarpetaDestino(){
    return this.nombreCarpetaDestino;
  }

  public boolean getUsoProxy() {
    if(this.usoProxy.equals("true")){
      return true;
    }else{
     return false;
    }
  }
}
