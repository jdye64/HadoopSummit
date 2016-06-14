package com.jeremydyer.nifi;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.apache.nifi.stream.io.ByteArrayInputStream;
import org.opencv.core.Core;
import org.opencv.core.MatOfByte;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.videoio.VideoCapture;

/**
 * Created by jdyer on 6/14/16.
 */
public class StandaloneWebCamCapture {

    public static void main(String[] args) {

        System.out.println("Starting test application to test grabbing images from WebCam in Java and Docker");
        System.loadLibrary(Core.NATIVE_LIBRARY_NAME);
        VideoCapture camera = new VideoCapture(0);

        try {
            Thread.sleep(3000);             //Give the Camera a few seconds to initialize
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        camera.open(0);

        if(!camera.isOpened()){
            System.out.println("Camera Error loading");
        }
        else{
            System.out.println("Camera loaded OK!");
        }

        MatOfByte image = new MatOfByte();
        MatOfByte bytemat = new MatOfByte();

        camera.read(image);
        Imgcodecs.imencode(".png", image, bytemat);
        byte[] bytes = bytemat.toArray();

        InputStream in = new ByteArrayInputStream(bytes);

        try {
            final BufferedImage img = ImageIO.read(in);
            ImageIO.write(img, "PNG", new FileOutputStream(new File("/TestWebCamCaptureImage.png")));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
