package com.erp.mterp.config;

import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

public class ImageResize {

    /***********Function To Convert MultipartFile To File
     * @param saveDirectory
     * @param fileName ****************


     */
    //***********Function To Resize File New Code With FIX Pixel Size****************
    public static File Resizepic2D(File fb, int width, int height, String saveDirectory, String fileName) throws IOException {
//		File resizeimg = new File(saveDirectory+fileName+".jpg");	

        File resizeimg = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + fileName + ".jpg");
        BufferedImage image = ImageIO.read(fb);


        final BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        final Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setComposite(AlphaComposite.Src);
        //below three lines are for RenderingHints for better image quality at cost of higher processing time
        graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(image, 0, 0, width, height, null);
        graphics2D.dispose();

        ImageIO.write(bufferedImage, "jpg", resizeimg);
        return resizeimg;

    }

    //**********************************************************************

    //***********Function To Resize File Old Code With Smooth Image but High Size****************


    public static File Resizepic(File fb, int width, int height, String saveDirectory, String fileName) throws IOException {
        File resizeimg = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + fileName + ".jpg");
        BufferedImage image = ImageIO.read(fb);

        int type = image.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : image.getType();

        BufferedImage resizedIm = new BufferedImage(width, height, type);

        Image scaledImage = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        resizedIm.getGraphics().drawImage(scaledImage, 0, 0, null);
        ImageIO.write(image, "jpg", resizeimg);
        return resizeimg;

    }
    //**********************************************************************

	/*public static BufferedImage Resizepic(BufferedImage image,int width,int height) throws IOException 
	{
		int type = image.getType() == 0? BufferedImage.TYPE_INT_ARGB : image.getType();
	    BufferedImage resizedIm= new BufferedImage(width,height, type);
	    Image scaledImage = image.getScaledInstance(width, height, Image.SCALE_SMOOTH);
	    resizedIm.getGraphics().drawImage(scaledImage, 0, 0, null);
	 
	    return resizedIm;
	}*/


    //***********Function To Convert MultipartFile To File****************
    public static File convert(MultipartFile file) throws IOException {
        System.out.println(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                file.getOriginalFilename());
        File convFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") +
                file.getOriginalFilename());
        file.transferTo(convFile);
        return convFile;
	    /*File convFile = new File(file.getOriginalFilename());
	    convFile.createNewFile();
	    FileOutputStream fos = new FileOutputStream(convFile);
	    fos.write(file.getBytes());
	    fos.close();
	    return convFile;*/
    }
    //**********************************************************************


    //***************************rotateBy For Image*******************************************


    public static Image rotateBy(BufferedImage source, double degrees) {

        // The size of the original image
        int w = source.getWidth();
        int h = source.getHeight();
        // The angel of the rotation in radians
        double rads = Math.toRadians(degrees);
        // Some nice math which demonstrates I have no idea what I'm talking about
        // Okay, this calculates the amount of space the image will need in
        // order not be clipped when it's rotated
        double sin = Math.abs(Math.sin(rads));
        double cos = Math.abs(Math.cos(rads));
        int newWidth = (int) Math.floor(w * cos + h * sin);
        int newHeight = (int) Math.floor(h * cos + w * sin);

        // A new image, into which the original can be painted
        BufferedImage rotated = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = rotated.createGraphics();
        // The transformation which will be used to actually rotate the image
        // The translation, actually makes sure that the image is positioned onto
        // the viewable area of the image
        AffineTransform at = new AffineTransform();
        at.translate((newWidth - w) / 2, (newHeight - h) / 2);

        // And we rotate about the center of the image...
        int x = w / 2;
        int y = h / 2;
        at.rotate(rads, x, y);
        g2d.setTransform(at);
        // And we paint the original image onto the new image
        g2d.drawImage(source, 0, 0, null);
        g2d.dispose();

        return rotated;
    }

    //**********************************************************************


    public static File rotateImgFromUrl(URL url, String fileName, double degrees) throws IOException {
        File resizeimg = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + fileName);

        BufferedImage source = ImageIO.read(url);
        // The size of the original image
        int w = source.getWidth();
        int h = source.getHeight();
        // The angel of the rotation in radians
        double rads = Math.toRadians(degrees);
        // Some nice math which demonstrates I have no idea what I'm talking about
        // Okay, this calculates the amount of space the image will need in
        // order not be clipped when it's rotated
        double sin = Math.abs(Math.sin(rads));
        double cos = Math.abs(Math.cos(rads));
        int newWidth = (int) Math.floor(w * cos + h * sin);
        int newHeight = (int) Math.floor(h * cos + w * sin);

        // A new image, into which the original can be painted
        BufferedImage rotated = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = rotated.createGraphics();
        // The transformation which will be used to actually rotate the image
        // The translation, actually makes sure that the image is positioned onto
        // the viewable area of the image
        AffineTransform at = new AffineTransform();
        at.translate((newWidth - w) / 2, (newHeight - h) / 2);

        // And we rotate about the center of the image...
        int x = w / 2;
        int y = h / 2;
        at.rotate(rads, x, y);
        g2d.setTransform(at);
        // And we paint the original image onto the new image
        g2d.drawImage(source, 0, 0, null);
        g2d.dispose();

        ImageIO.write(rotated, "jpg", resizeimg);
        return resizeimg;
        // return rotated;
    }

    //**********************************************************************

}
