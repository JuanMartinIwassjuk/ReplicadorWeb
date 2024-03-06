package Entities;

import java.io.IOException;
import java.net.MalformedURLException;
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

        System.out.println("Se Ignora URL de tipo 'javascript' " + e.getMessage());

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

        System.out.println("Se Ignora URL de tipo 'javascript' " + e.getMessage());

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

}