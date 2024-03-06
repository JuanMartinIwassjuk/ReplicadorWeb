package Entities;

import java.net.MalformedURLException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.*;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

public class ReplicadorWeb {


  public static void main(String[] args) throws IOException {

    Configuracion config = new Configuracion();

    config.cargarConfiguracion();

    String url = config.getURL(); // Reemplaza con la URL de la página web a replicar

    String directorioActual = System.getProperty("user.dir");

    String carpetaDestino = directorioActual + File.separator + config.getNombreCarpetaDestino();  // Crear la carpeta de destino dentro del proyecto

    GestorDescargaRecursos.descargarPagina(url, carpetaDestino, config);

  }


}








