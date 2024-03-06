package Entities;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.Base64;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import java.net.PasswordAuthentication;

public class ConexionService {



  public static Document realizarConexion(Configuracion config, String url) throws IOException {

    Document doc;

    try {

      if (config.getUsoProxy()) {// Si el proxy esta activado

        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(config.getProxyHost(), config.getProxyPort()));

        if(config.getProxyUsername()!=null) { // Si esta configurado un usuario y contraseña
          doc = Jsoup.connect(url)
              .proxy(proxy)
              .timeout(config.getTimeOut())
              .userAgent(config.getUserAgent())
              .header("Authorization", "Basic " + Base64.getEncoder().encodeToString((config.getProxyUsername() + ":" + config.getProxyPassword()).getBytes()))
              .get();
        }else{ // Si NO esta configurado un usuario y contraseña
          doc=(Jsoup.connect(url).proxy(proxy).timeout(config.getTimeOut()).get());
        }

        System.out.println("Conexion ok en IP: " + config.getProxyHost() + " y puerto "+config.getProxyPort());

        return doc;

      } else {  // Si el proxy esta desactivado

        doc = Jsoup.connect(url).get();

        return doc;
      }

    } catch (IOException e) {

      e.printStackTrace();

    }

   return doc=null;

  }

}
