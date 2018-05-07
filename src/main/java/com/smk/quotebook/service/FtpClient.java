package com.smk.quotebook.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.web.multipart.MultipartFile;

public class FtpClient {
	private String svrIp;
	private String user;
	private String passwd;
	private String defaultPath;
	private String port;
	private String serverFile;

	public FtpClient() {
	}

	public FtpClient(String svrIp, String user, String passwd, String defaultPath) {
		super();
		this.svrIp = svrIp;
		this.user = user;
		this.passwd = passwd;
		this.defaultPath = defaultPath;
	}

	

	public FtpClient(String svrIp, String user, String passwd, String defaultPath, String port, String serverFile) {
		super();
		this.svrIp = svrIp;
		this.user = user;
		this.passwd = passwd;
		this.defaultPath = defaultPath;
		this.port = port;
		this.serverFile = serverFile;
	}

	public void init(Properties p) {
		svrIp = p.getProperty("server_ip");
		user = p.getProperty("user_name");
		passwd = p.getProperty("password");
		defaultPath = p.getProperty("default_path");
	}

	public boolean upload(File org, String targetFile) throws SocketException, IOException, Exception {
		FileInputStream fis = null;
		org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
		clnt.setControlEncoding("utf-8");	
		try {
			clnt.connect(svrIp);
			// clnt.setBufferSize(1024*1024);
			int reply = clnt.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				throw new Exception("ftp connection refused");
			}
			clnt.setSoTimeout(1000 * 10);
			boolean iflogin = clnt.login(user, passwd);
			System.out.println("login: " + iflogin);
			boolean ifsetFiletype = clnt.setFileType(FTP.BINARY_FILE_TYPE);
			System.out.println("setFileType: " + ifsetFiletype);
			clnt.enterLocalActiveMode();
			// clnt.enterLocalPassiveMode();
			// clnt.changeWorkingDirectory(defaultPath);
			// clnt.makeDirectory("");
			fis = new FileInputStream(org);
			return clnt.storeFile(targetFile, fis);			
		} finally {
			if (clnt.isConnected()) {
				clnt.disconnect();
			}
			if (fis != null) {
				fis.close();
			}
		}
	}
	
	public boolean delete(String pathname) throws SocketException, IOException, Exception {
		org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
		clnt.setControlEncoding("utf-8");
		try {					
			clnt.connect(svrIp);
			// clnt.setBufferSize(1024*1024);
			int reply = clnt.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				throw new Exception("ftp connection refused");
			}
			clnt.setSoTimeout(1000 * 10);
			boolean iflogin = clnt.login(user, passwd);
			System.out.println("login: " + iflogin);
			boolean ifsetFiletype = clnt.setFileType(FTP.BINARY_FILE_TYPE);
			System.out.println("setFileType: " + ifsetFiletype);
			clnt.enterLocalActiveMode();
			// clnt.enterLocalPassiveMode();
			// clnt.changeWorkingDirectory(defaultPath);
			// clnt.makeDirectory("");		
			return clnt.deleteFile(pathname);	
		} finally {
			if (clnt.isConnected()) {
				clnt.disconnect();
			}			
		}
	}
	
	
	public String[] listNames(String pathname) throws SocketException, IOException, Exception {
		org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
		clnt.setControlEncoding("utf-8");		
		try {					
			clnt.connect(svrIp);
			// clnt.setBufferSize(1024*1024);
			int reply = clnt.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				throw new Exception("ftp connection refused");
			}
			clnt.setSoTimeout(1000 * 10);
			boolean iflogin = clnt.login(user, passwd);
			System.out.println("login: " + iflogin);
			boolean ifsetFiletype = clnt.setFileType(FTP.BINARY_FILE_TYPE);
			System.out.println("setFileType: " + ifsetFiletype);
			clnt.enterLocalActiveMode();
			// clnt.enterLocalPassiveMode();
			// clnt.changeWorkingDirectory(defaultPath);
			// clnt.makeDirectory("");		
			return clnt.listNames(pathname);	
		} finally {
			if (clnt.isConnected()) {
				clnt.disconnect();
			}			
		}
	}
	
	public String[] listNames() throws SocketException, IOException, Exception {
		org.apache.commons.net.ftp.FTPClient clnt = new org.apache.commons.net.ftp.FTPClient();
		clnt.setControlEncoding("utf-8");		
		try {					
			clnt.connect(svrIp);
			// clnt.setBufferSize(1024*1024);
			int reply = clnt.getReplyCode();
			if (!FTPReply.isPositiveCompletion(reply)) {
				throw new Exception("ftp connection refused");
			}
			clnt.setSoTimeout(1000 * 10);
			boolean iflogin = clnt.login(user, passwd);
			System.out.println("login: " + iflogin);
			boolean ifsetFiletype = clnt.setFileType(FTP.BINARY_FILE_TYPE);
			System.out.println("setFileType: " + ifsetFiletype);
			clnt.enterLocalActiveMode();
			// clnt.enterLocalPassiveMode();
			// clnt.changeWorkingDirectory(defaultPath);
			// clnt.makeDirectory("");		
			return clnt.listNames();	
		} finally {
			if (clnt.isConnected()) {
				clnt.disconnect();
			}			
		}
	}
	

	public File fileConvert(MultipartFile mfile) {
		File convertedFile = new File(mfile.getOriginalFilename());
		try {
			convertedFile.createNewFile();
			FileOutputStream os = new FileOutputStream(convertedFile);
			os.write(mfile.getBytes());
			os.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return convertedFile;
	}



}
