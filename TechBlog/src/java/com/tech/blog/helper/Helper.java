/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.helper;

import java.io.*;

/**
 *
 * @author piyush
 */
public class Helper {

    public static boolean deleteProfile(String path) {
        boolean f = false;
        try {
            File file = new File(path);
            f = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static boolean saveProfile(InputStream is, String path) {
        boolean f = false;

        try {
            byte[] b = new byte[is.available()];

            is.read(b);

            FileOutputStream fos = new FileOutputStream(path);

            fos.write(b);

            fos.flush();

            fos.close();

            f = true;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return f;
    }
}
