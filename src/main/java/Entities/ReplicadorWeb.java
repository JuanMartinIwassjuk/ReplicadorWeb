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


  public static void main(String[] args) {

    Configuracion config = new Configuracion();

    config.cargarConfiguracion();

    String url = config.getURL(); // Reemplaza con la URL de la página web a replicar

    String directorioActual = System.getProperty("user.dir");

    String carpetaDestino = directorioActual + File.separator + config.getNombreCarpetaDestino();  // Crear la carpeta de destino dentro del proyecto

    try {
      descargarPagina(url, carpetaDestino, config);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }


  private static void descargarPagina(String url, String carpetaDestino, Configuracion config) throws IOException {

    Document doc = null;



    try {

      if (config.getUsoProxy() == true) {

        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(config.getProxyHost(), config.getProxyPort()));

        doc = Jsoup.connect(url).proxy(proxy).timeout(config.getTimeOut()).get();

        System.out.println("Conexion ok en IP: " + config.getProxyHost() + " y puerto "+config.getProxyPort());

      } else {
        doc = Jsoup.connect(url).get();
      }
    } catch (IOException e) {

      e.printStackTrace();

    }

    // Crea la carpeta de destino si no existe
    File carpetaDestinoFile = new File(carpetaDestino);

    if (!carpetaDestinoFile.exists()) {

      carpetaDestinoFile.mkdirs();

    }


    // Descarga recursos asociados y modificar URLs en el HTML

    Elements elementosSRC = doc.select("[src]");

    for (Element elementoSRC : elementosSRC) {
      try {
        elementoSRC.attr("src", descargarRecurso(elementoSRC.attr("abs:src"), carpetaDestino));
      } catch (MalformedURLException e) {

        System.out.println(" Se Ignora URL de tipo 'javascript'" + e.getMessage());

      }
    }

    Elements elementosHREF = doc.select("[href]");

    for (Element elementoHREF : elementosHREF) {
      try {
        elementoHREF.attr("href", descargarRecurso(elementoHREF.attr("abs:href"), carpetaDestino));
      } catch (MalformedURLException e) {

        System.out.println(" Se Ignora URL de tipo 'javascript'" + e.getMessage());

      }

    }


    Elements elementosSTYLE = doc.select("[style]");

    for (Element elementoSTYLE : elementosSTYLE) {
      try {
        String urlBG=ExtractImageURLs.obtenerURLDeBI(elementoSTYLE.attr("abs:style"));
          System.out.println("La url a descargar SE STYLE es"+urlBG + " "+" y la ruta q voy a descargar es esta "+ config.getURL()+File.separator+urlBG);
            elementoSTYLE.attr("style", descargarRecurso(config.getURL()+"/"+urlBG, carpetaDestino));

      } catch (MalformedURLException e) {

        System.out.println(" Se Ignora URL de tipo 'javascript'" + e.getMessage());

      }

    }

    //----------------------------

    // Guardar el HTML modificado en un nuevo archivo
    try (PrintWriter writer = new PrintWriter(new File(carpetaDestino, "index.html"))) {

      writer.write(doc.outerHtml());

    }
  }

  private static String descargarRecurso(String url, String carpetaDestino) throws IOException {

    URL recursoURL = new URL(url);

    String nombreArchivo = obtenerNombreArchivoDesdeURL(url);

    Path archivoDestino = Paths.get(carpetaDestino, nombreArchivo);

    // Descarga el recurso solo si no existe localmente

    if (!Files.exists(archivoDestino)) {

      try (InputStream in = recursoURL.openStream()) {

        Files.copy(in, archivoDestino, StandardCopyOption.REPLACE_EXISTING);

      } catch (FileNotFoundException e) { // por si algun archivo que fue referenciado se encuentra borrado

        System.out.println("Error: " + e.getMessage());

      } catch (IOException e) {// falla la url

        System.out.println("Error: " + e.getMessage());

      }
    }

    return nombreArchivo;
  }

  private static String obtenerNombreArchivoDesdeURL(String url) throws MalformedURLException {

    URL recursoURL = new URL(url);

    // Obtener el último segmento de la ruta de la URL como nombre de archivo

    String path = recursoURL.getPath();

    String[] segments = path.split("/");

    // Verificar si hay elementos en el array antes de intentar acceder al último

    String nombreArchivo = "";

    if (segments.length > 0) {

      nombreArchivo = segments[segments.length - 1];

    }

    // Si el nombre de archivo sigue siendo vacío, intentar con el host y el path

    if (nombreArchivo == null || nombreArchivo.isEmpty()) {

      nombreArchivo = recursoURL.getHost() + path.replace("/", "_");

    }

    // Si todavía es nulo o vacío, proporcionar un nombre predeterminado

    if (nombreArchivo == null || nombreArchivo.isEmpty()) {

      nombreArchivo = "archivo_desconocido";

    }

    return nombreArchivo;
  }


  public static class BackgroundImageExtractor {

    public static List<String> extraerURLsDeFondo(String estilo) {
      List<String> urls = new ArrayList<>();

      Pattern pattern = Pattern.compile("background-image:\\s*url\\(['\"]([^'\"]+)['\"]\\)");
      Matcher matcher = pattern.matcher(estilo);

      while (matcher.find()) {
        String url = matcher.group(1);
        urls.add(url);
      }

      return urls;
    }

  }
}





