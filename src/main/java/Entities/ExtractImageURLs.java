package Entities;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ExtractImageURLs {
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
    System.out.println("El input que fallo es " + input + " " + e.getMessage());
  }

    return imageUrl;


  }
}