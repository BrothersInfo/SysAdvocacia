package br.com.sysadv.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.imageio.ImageIO;

public class Conversor {
	public static byte[] stringToByte(String stringImagem) {
		System.out.println("stringToByte");
		if (stringImagem != null) {
			int index = stringImagem.indexOf(";base64");

			String imagemOK = stringImagem.substring(index + 8);

			byte[] imagemInByte = Base64.getDecoder().decode(imagemOK.getBytes());

			return imagemInByte;
		} else {
			return null;
		}
	}

	public static String byteToString(byte[] byteImagem, String nomeContato) {
		System.out.println("byteToString");
		String foto = null;
		try {
			File arquivo = new File("C:\\Fotos\\" + nomeContato + ".PNG");
			InputStream is = new ByteArrayInputStream(byteImagem);
			BufferedImage bi = ImageIO.read(is);

			if (!arquivo.isFile()) {
				ImageIO.write(bi, "png", arquivo);
				foto = arquivo.getAbsolutePath();
			} else {
				foto = arquivo.getAbsolutePath();
			}
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return foto;
	}

	public static String byteToEncode64(byte[] imageByte) {
		byte[] encoded = Base64.getEncoder().encode(imageByte);
		return new String(encoded);
	}
	
	public static void main(String[] args)  {

		int index = imagemOriginal.indexOf(";base64");

		String imagemOK = imagemOriginal.substring(index + 8);

		byte[] imagemInByte = Base64.getDecoder().decode(imagemOK.getBytes());
		
		byteToEncode64(imagemInByte);

		InputStream is = new ByteArrayInputStream(imagemInByte);
		BufferedImage bi;
		try {
			bi = ImageIO.read(is);
			ImageIO.write(bi, "png", new File("C:\\Fotos\\Filha - Anna Julia Ferreira Ribeiro.png"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

	}
}