package com.erp.mterp.utill;

import lombok.extern.java.Log;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRTextExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.util.JRSaver;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

@Service
@Log
public class JasperExporter {
    @Value("${spring.profiles.active}")
    private static String applicationStatus;


    private static String replicaDatabaseDriver = "";
    private static String replicaDatabaseUrl = "";
    private static String replicaDatabaseUserName = "";
    private static String replicaDatabasePassword = "";

    private static String primaryDatabaseDriver = "";
    private static String primaryDatabaseUrl = "";
    private static String primaryDatabaseUserName = "";
    private static String primaryDatabasePassword = "";

    String tempfileprefix = "output.";
    String tempfilesuffixpdf = ".pdf";
    String contenttypepdf = "application/pdf";


    public static Connection getConnection() throws ClassNotFoundException {
        Connection connection = null;
        try {
            if (StringUtils.isNotBlank(primaryDatabaseDriver) && StringUtils.isNotBlank(primaryDatabaseUrl)
                    && StringUtils.isNotBlank(primaryDatabaseUserName)
                    && StringUtils.isNotBlank(primaryDatabasePassword)) {
                // log.info("<<<<<<<<<<< INSIDE getConnection PRIMARY DB CONNECTION ESTABLISH >>>>>>>>");
                Class.forName(primaryDatabaseDriver);
                connection = (Connection) DriverManager.getConnection(primaryDatabaseUrl, primaryDatabaseUserName,
                        primaryDatabasePassword);
            } else {
                // log.info("<<<<<<<<<<< INSIDE getConnection DEFAULT PRIMARY DB CONNECTION NOT AVAILABLE >>>>>>>>");
            }

        } catch (SQLException exception){
            exception.printStackTrace();
        }
        return connection;
    }

    JasperReport getreport(String jrxmlpath) throws JRException {
        JasperReport jr = null;
        log.warning("before remove "+jrxmlpath);
        jrxmlpath=jrxmlpath.replace(".jrxml","");
        log.warning("after remove "+jrxmlpath);
        File f = new File(jrxmlpath+".jasper");
        if (f.exists()) {
            try {
                jr = (JasperReport) JRLoader.loadObject(f);
            } catch (JRException e) {
                throw new RuntimeException(e);
            }
        } else {
            jr = compileJasperReport(jrxmlpath);
        }
        return jr;
    }
    public synchronized JasperReport compileJasperReport(String jrxmlpath) throws JRException {
        JasperReport jr = null;
        jr = JasperCompileManager.compileReport(jrxmlpath+".jrxml");
        JRSaver.saveObject(jr, jrxmlpath+".jasper");
        return jr;
    }

    public void jasperExporterPDF(HashMap jasperParameter, String jrxmlpath, String fileName, HttpServletResponse response) throws IOException {
        Connection connection = null;
        OutputStream outputStream;
        try {
            connection = getConnection();
            outputStream = response.getOutputStream();
            JasperReport jasperReport = getreport(jrxmlpath);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, jasperParameter, connection);
            File file = File.createTempFile(tempfileprefix, tempfilesuffixpdf);
            response.setContentType(contenttypepdf);
            response.setHeader("Content-disposition", "inline; filename=" + fileName + tempfilesuffixpdf);
            JasperExportManager.exportReportToPdfStream(jasperPrint, outputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                // log.info("about to close db connection");
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
//                connection = null;
            }
        }
    }
}

