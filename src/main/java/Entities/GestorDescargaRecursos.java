package Entities;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import org.jsoup.nodes.Document;

public class GestorDescargaRecursos {

  public static  void descargarPagina(String url, String carpetaDestino, Configuracion config) throws IOException {

    try {

      Document doc = ConexionService.realizarConexion(config, url);

      // Crea la carpeta de destino si no existe

      File carpetaDestinoFile = new File(carpetaDestino);

      if (!carpetaDestinoFile.exists()) {

        carpetaDestinoFile.mkdirs();

      }

      // Descarga recursos asociados y modificar URLs en el HTML

      GestorRecursosHTML.descargarRecursosYModificarURLs("src",doc,carpetaDestino);

      GestorRecursosHTML.descargarRecursosYModificarURLs("href",doc,carpetaDestino);

      GestorRecursosHTML.descargarRecursosYModificarURLsStyle(doc,carpetaDestino,config);


      // Guardar el HTML modificado en un nuevo archivo
      try (PrintWriter writer = new PrintWriter(new File(carpetaDestino, "index.html"))) {

        writer.write(doc.outerHtml());

      }

    } catch (IOException e) {

      e.printStackTrace();

    }

  }
  public static String descargarRecurso(String url, String carpetaDestino) throws IOException {

    URL recursoURL = new URL(url);

    String nombreArchivo = GestorRecursosHTML.obtenerNombreArchivoDesdeURL(url);

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



}
