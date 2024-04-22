package com.erp.mterp.config;

import java.io.IOException;
import java.io.InputStream;

import org.apache.commons.lang3.StringUtils;
import org.apache.tika.detect.DefaultDetector;
import org.apache.tika.detect.Detector;
import org.apache.tika.io.TikaInputStream;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.mime.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.erp.mterp.constant.Constant;
import com.erp.mterp.dto.FileValidationResponse;

import lombok.extern.java.Log;

@Log
@Component
public class SecurityValidation {
	/**
	 * > If the string is not blank, check if the first character of the string is
	 * in the list of CSV injection characters
	 * 
	 * @param str The string to be checked for CSV injection characters.
	 * @return A boolean value.
	 */
	public boolean hasCsvInjectionCharacters(String str) {
		try {
			if (StringUtils.isNotBlank(str)) {
				String fc = String.valueOf((int) str.trim().charAt(0));
				if (Constant.CSV_INJECTION_CHARACTERS.contains(fc)) {
					return true;
				} else {
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * It removes the first character of the string if it is one of the following
	 * characters: `@+=-`
	 * 
	 * @param str The string to be checked for CSV injection characters.
	 * @return The first character of the string is being returned.
	 */
	public String replaceCsvInjectionCharacters(String str) {
		try {
			if (StringUtils.isNotBlank(str)) {
				return StringUtils.stripStart(str.trim(), "@+=-><");
//				String fc = String.valueOf((int) str.trim().charAt(0));
//				if (Constant.`	2CSV_INJECTION_CHARACTERS.contains(fc)) {
//					// return StringEscapeUtils.escapeCsv(str.substring(1));
//					return str.substring(1);
//				} else {
//					return str;
//				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	/**
	 * If the string has CSV injection characters, replace them with their escaped
	 * equivalents. Otherwise, return the string
	 * 
	 * @param str The string to check for CSV injection characters.
	 * @return A string.
	 */
	public String checkAndReplaceCsvInjectionCharacters(String str) {
		return (hasCsvInjectionCharacters(str)) ? replaceCsvInjectionCharacters(str) : str;
	}

	public boolean checkAndCsvInjectionCharacters(String str) {
		return hasCsvInjectionCharacters(str);
	}

	/**
	 * It takes a byte array and a filename with extension, and returns the original
	 * content type of the file
	 * 
	 * @param fileBytes             The file bytes
	 * @param filenameWithExtension The filename with extension.
	 * @return The MIME type of the file.
	 */
	public String getOriginalContentType(byte[] fileBytes, String filenameWithExtension) throws IOException {
		Detector detector = new DefaultDetector();
		Metadata metadata = new Metadata();
		InputStream stream = TikaInputStream.get(fileBytes, metadata);
		metadata.add(Metadata.RESOURCE_NAME_KEY, filenameWithExtension);
		MediaType mediaType = detector.detect(stream, metadata);
		// log.info("file name>>>>>>"+filenameWithExtension);
		// log.info("real content type>>>>>>"+mediaType.getBaseType().toString());
		return mediaType.getBaseType().toString();
	}

	/**
	 * It takes a file and a type as input and returns a FileValidationResponse
	 * object
	 * 
	 * @param file The file to be validated.
	 * @param type This is the type of file you want to validate.
	 * @return A FileValidationResponse object.
	 */
	public FileValidationResponse validateFile(MultipartFile file, String type) throws IOException {
		boolean status = true;
		String message = "valid";
		long fileSize = file.getSize();
		if (type.equalsIgnoreCase(Constant.FILE_IMAGE)) {
			if (fileSize > Constant.MAX_FILE_SIZE_IMAGE) {
				status = false;
				message = "File size must be less then " + Constant.MAX_FILE_SIZE_IMAGE / (1024 * 1024) + " MB";
			} else if (!Constant.VALID_FILE_TYPE_IMAGE
					.contains(getOriginalContentType(file.getBytes(), file.getOriginalFilename().trim()))) {
				status = false;
				message = "Invalid File Type";
			}
		} else if (type.equalsIgnoreCase(Constant.FILE_IMAGE_AND_PDF)) {
			if (fileSize > Constant.MAX_FILE_SIZE_OTHER) {
				status = false;
				message = "File size must be less then " + Constant.MAX_FILE_SIZE_OTHER / (1024 * 1024) + " MB";
			} else if (!Constant.VALID_FILE_TYPE_IMAGE_PDF
					.contains(getOriginalContentType(file.getBytes(), file.getOriginalFilename().trim()))) {
				status = false;
				message = "Invalid File Type";
			}
		} else if (type.equalsIgnoreCase(Constant.FILE_EXCEL)) {
			if (fileSize > Constant.MAX_FILE_SIZE_OTHER) {
				status = false;
				message = "File size must be less then " + Constant.MAX_FILE_SIZE_OTHER / (1024 * 1024) + " MB";
			} else if (!Constant.VALID_FILE_TYPE_EXCEL
					.contains(getOriginalContentType(file.getBytes(), file.getOriginalFilename().trim()))) {
				status = false;
				message = "Invalid File Type";
			}
		} else if (type.equalsIgnoreCase(Constant.FILE_IMAGE_PDF_EXCEL_CSV)) {
			if (fileSize > Constant.MAX_FILE_SIZE_OTHER) {
				status = false;
				message = "File size must be less then " + Constant.MAX_FILE_SIZE_OTHER / (1024 * 1024) + " MB";
			} else if (!Constant.VALID_FILE_TYPE_IMAGE_PDF_EXCEL_CSV
					.contains(getOriginalContentType(file.getBytes(), file.getOriginalFilename().trim()))) {
				status = false;
				message = "Invalid File Type";
			}
		}
		return new FileValidationResponse(status, message);
	}

}
