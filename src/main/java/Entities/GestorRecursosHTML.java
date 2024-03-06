package Entities;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



public  class GestorRecursosHTML{
  public static void descargarRecursosYModificarURLs(String atributo, Document doc, String carpetaDestino){

    Elements elementos = doc.select("[" + atributo + "]");

    for (Element elemento : elementos) {

      try {
        elemento.attr(atributo, GestorDescargaRecursos.descargarRecurso(elemento.attr("abs:"+atributo), carpetaDestino));

      } catch (MalformedURLException e) {

        System.out.println("Se Ignora URL de tipo " + e.getMessage());

      } catch (IOException e) {

        throw new RuntimeException(e);

      }
    }

  }
  public static void descargarRecursosYModificarURLsStyle(Document doc,String carpetaDestino,Configuracion config){

    Elements elementosSTYLE = doc.select("[style]");

    for (Element elementoSTYLE : elementosSTYLE) {

      try {

        String urlBG=GestorRecursosHTML.obtenerURLDeBI(elementoSTYLE.attr("abs:style"));

        elementoSTYLE.attr("style", GestorDescargaRecursos.descargarRecurso(config.getURL()+"/"+urlBG, carpetaDestino));

      } catch (MalformedURLException e) {

        System.out.println("Se Ignora URL de tipo " + e.getMessage());

      } catch (IOException e) {
        throw new RuntimeException(e);
      }

    }

  }

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

  public static String obtenerURLDeBI(String input){
    String pattern = "background-image:url\\((.*?)\\);";

    Pattern regex = Pattern.compile(pattern);

    Matcher matcher = regex.matcher(input);

    // Encontrar y mostrar las URL de las imágenes
    matcher.find();
    String imageUrl="";
    try {
      imageUrl = matcher.group(1);
    }catch (IllegalStateException e){
      System.out.println("Se ignora input sin url " + input + " " + e.getMessage());
    }

    return imageUrl;


  }

  public static String obtenerNombreArchivoDesdeURL(String url) throws MalformedURLException {

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

}