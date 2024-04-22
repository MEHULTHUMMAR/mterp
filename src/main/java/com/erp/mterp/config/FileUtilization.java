package com.erp.mterp.config;

import java.io.File;

public class FileUtilization {

    public static String getFileExtension(File file) {
        String fileName = file.getName();
        if (fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)

            return fileName.substring(fileName.lastIndexOf(".") + 1);
        else return "";
    }
}
