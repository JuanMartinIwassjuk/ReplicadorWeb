package Entities;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class ConexionService {

  public static Document realizarConexion(Configuracion config, String url) throws IOException {

    Document doc;

    try {

      if (config.getUsoProxy()) {

        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(config.getProxyHost(), config.getProxyPort()));

        doc=(Jsoup.connect(url).proxy(proxy).timeout(config.getTimeOut()).get());

        System.out.println("Conexion ok en IP: " + config.getProxyHost() + " y puerto "+config.getProxyPort());

        return doc;

      } else {

        doc = Jsoup.connect(url).get();

        return doc;
      }

    } catch (IOException e) {

      e.printStackTrace();

    }

   return doc=null;

  }

}
