/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.sysadv.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
import uk.co.mmscomputing.imageio.tiff.TIFFImageWriteParam;
import uk.co.mmscomputing.imageio.tiff.TIFFImageWriter;
import uk.co.mmscomputing.imageio.tiff.TIFFImageWriterSpi;

/**
 *
 * @author BrothersInfo
 */
public class Tiff {
    
    public static void main(String[] args) {
        String imagem = "C:\\ABQM\\FredDamy.jpg";
        BufferedImage bufferedImage;
        try {
            bufferedImage = ImageIO.read(new File(imagem));
            salvarTifCinza(bufferedImage, "C:\\ABQM", "fd.jpeg");
        } catch (IOException ex) {
            Logger.getLogger(Tiff.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void salvarTifCinza(BufferedImage bufferedImage, String path, String nomeArquivo) {
        FileImageOutputStream fileImageOutputStream;
        try {
            TIFFImageWriter writer = (TIFFImageWriter) new TIFFImageWriterSpi().createWriterInstance();
            TIFFImageWriteParam param1 = (TIFFImageWriteParam) writer.getDefaultWriteParam();
            param1.setCompressionType("jpeg");
            param1.setPhotometricInterpretation("BLACKISZERO");
            param1.setCompressionQuality(1.0f);

            File file = new File(path);
			file.mkdirs();
			file = new File(path + "/" + nomeArquivo);
			file.createNewFile();
			
            fileImageOutputStream = new FileImageOutputStream(file);
            writer.setOutput(fileImageOutputStream);
            writer.prepareWriteSequence(null);
            //for (int i = 0; i < bufferedImage.length; i++) {
                if (bufferedImage != null) {
                    writer.writeToSequence(new IIOImage(bufferedImage, null, null), param1);
                }
            //}
            writer.endWriteSequence();
            writer.dispose();
            fileImageOutputStream.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }
}
