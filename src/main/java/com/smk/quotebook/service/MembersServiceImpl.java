package com.smk.quotebook.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.smk.quotebook.dao.MembersDao;
import com.smk.quotebook.model.Members;

@Service
public class MembersServiceImpl implements MembersService{
	@Autowired
	private MembersDao memberDao;

	@Override
	public int idChk(String mId) {
		// TODO Auto-generated method stub
		return memberDao.idChk(mId);
	}

	@Override
	public int nameChk(String mName) {
		// TODO Auto-generated method stub
		return memberDao.nameChk(mName);
	}
	private int copy(String originalFile, String targetFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os =null;
		try{
			is = new FileInputStream(originalFile);
			os = new FileOutputStream(targetFile);
			byte[] buff = new byte[1024*1024];
			int nRead;
			while((nRead = is.read(buff))!=-1){
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		}catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try{
				if(is!=null) is.close();
				if(os!=null) os.close();
			}catch(IOException e){
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
	
	


	@Override
	public int loginChk(Members loginmember) {
		// TODO Auto-generated method stub
		System.out.println("loginMember "+loginmember);
		int result=0;
		String mid=loginmember.getMid();
		String mpw=loginmember.getMpw();
		System.out.println("mid: "+mid);
		System.out.println("mpw: "+mpw);
		int exist=memberDao.idChk(mid);
		
		if(exist==1) {
			int drop = memberDao.getDrop(mid);
			if(drop==0) {
				Members memberDB= memberDao.getMember(mid);
				if(mpw.equals(memberDB.getMpw())) {
					result=1;
				}else if(!mpw.equals(memberDB.getMpw())) {
					result=0;
				}
			}else {
				result=-2;
			}			
		}else {
			result=-1;
		}
		return result;
	}

	@Override
	public Members getMember(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getMember(mid);
	}

	@Override
	public Members getMember2(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getMember2(mid);
	}

	@Override
	public int pointUp(Members member) {
		// TODO Auto-generated method stub
		return memberDao.pointUp(member);
	}

	@Override
	public int memberModify(MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		//System.out.println("mRequest "+mRequest);
		ArrayList<String> filelist1= new ArrayList<>();
		ArrayList<String> filelist2= new ArrayList<>();
		String uploadPath = mRequest.getRealPath("profile/");
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = {"",""};
		int idx = 0;
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next(); //input name; mphoto		
			MultipartFile mFile = mRequest.getFile(uploadFileName); 
			String originFileName = mFile.getOriginalFilename();//realfilename		
			photo[idx] = originFileName;
			
			if(photo[idx]!="") {
				FtpClient ftp_ivr = new FtpClient("183.111.100.230", "nightsky", "cleanminded255@", "");		
				try {
					String[] fileNames1 =ftp_ivr.listNames("/tomcat/webapps/profile_backup/");	
					String[] fileNames2 =ftp_ivr.listNames("/tomcat/webapps/ROOT/profile/");	
					for(int i=0; i<fileNames1.length; i++) {
						filelist1.add(fileNames1[i].substring(fileNames1[i].lastIndexOf("/")+1, fileNames1[i].length()));					
					}
					for(int j=0; j<fileNames2.length;j++) {
						filelist2.add(fileNames2[j].substring(fileNames2[j].lastIndexOf("/")+1, fileNames2[j].length()));
					}
					System.out.println("files in profile_backup "+filelist1);
					System.out.println("files in ROOT/profile/ "+filelist2);
				} catch (SocketException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (IOException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (Exception e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				if(filelist1.contains(photo[idx])|| filelist2.contains(photo[idx])) {
					photo[idx]=System.currentTimeMillis()+"_"+photo[idx];
				}
				
				File file = ftp_ivr.fileConvert(mFile);
				boolean result1;
				boolean result2;
				try {
					result1 = ftp_ivr.upload(file, "/tomcat/webapps/profile_backup/"+photo[idx]);
					result2 = ftp_ivr.upload(file, "/tomcat/webapps/ROOT/profile/"+photo[idx]);
					System.out.println("FTP upload Success to profile_backup: "+result1);
					System.out.println("FTP upload Success to profile : "+result2);
				} catch (SocketException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				if(photo[idx] != null && !photo[idx].equals("")) {
					if(new File(uploadPath+photo[idx]).exists()){
						photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
					}
					try {					
						mFile.transferTo(new File(uploadPath+photo[idx]));
						System.out.println(idx+"서버 저장 : "+uploadPath+photo[idx]);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					photo[0] = "noimg.jpg";
				}			
				
				String current_mphoto=mRequest.getParameter("current_mphoto");
				System.out.println("current_mphoto :"+current_mphoto);
				//delete the previous photo if the user change his photo				
				/*if(current_mphoto!="noimg.jpg") {
					try {
						boolean deleteResult1= ftp_ivr.delete("/tomcat/webapps/profile_backup/"+current_mphoto);
						boolean deleteResult2= ftp_ivr.delete("/tomcat/webapps/ROOT/profile/"+current_mphoto);
						System.out.println(current_mphoto+" has been deleted successfully[at profile_backup] : "+deleteResult1);
						System.out.println(current_mphoto+" has been deleted successfully[at ROOT/profile] : "+deleteResult2);
					} catch (SocketException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
				}*/			
		  }//if
			idx++;
		} // while		
		System.out.println("photo[0]"+photo[0]);
		String current_aboutme=mRequest.getParameter("current_aboutme");
		String aboutme = mRequest.getParameter("aboutme");
		Members modifymember = new Members();
		modifymember.setMid(mRequest.getParameter("mid"));
		if(photo[0]=="" && !aboutme.equals(current_aboutme)) {//changed aboutme only
			modifymember.setAboutme(aboutme);
			return memberDao.updateAboutme(modifymember);
		}else if(photo[0]!="" && aboutme.equals(current_aboutme)){//changed mphoto only
			modifymember.setMphoto(photo[0]);			
			return memberDao.updateMphoto(modifymember);
		}else if(photo[0]!="" && !aboutme.equals(current_aboutme)) {//changed both
			modifymember.setMphoto(photo[0]);
			modifymember.setAboutme(aboutme);
			
			return memberDao.updateMphotoAboutme(modifymember);
		}else {
			System.out.println("aboutme"+aboutme);
			System.out.println("photo[0]"+photo[0]);
			System.out.println("You haven't changed anything");
			return 1;
		}		
	}
	
	@Override
	public int memberInsert(MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		System.out.println("mRequest "+mRequest);
		ArrayList<String> filelist1= new ArrayList<>();
		ArrayList<String> filelist2= new ArrayList<>();
		String uploadPath = mRequest.getRealPath("profile/");
		Iterator<String> iterator = mRequest.getFileNames();
		String[] photo = {"",""};
		int idx = 0;
		while(iterator.hasNext()) {
			String uploadFileName = iterator.next();//input name; mphoto	
			MultipartFile mFile = mRequest.getFile(uploadFileName); 
			String originFileName = mFile.getOriginalFilename();//realfilename
			photo[idx] = originFileName;
			if(photo[idx]!="") {
				FtpClient ftp_ivr = new FtpClient("183.111.100.230", "nightsky", "cleanminded255@", "");
				try {
					String[] fileNames1 =ftp_ivr.listNames("/tomcat/webapps/profile_backup/");	
					String[] fileNames2 =ftp_ivr.listNames("/tomcat/webapps/ROOT/profile/");	
					for(int i=0; i<fileNames1.length; i++) {
						filelist1.add(fileNames1[i].substring(fileNames1[i].lastIndexOf("/")+1, fileNames1[i].length()));					
					}
					for(int j=0; j<fileNames2.length;j++) {
						filelist2.add(fileNames2[j].substring(fileNames2[j].lastIndexOf("/")+1, fileNames2[j].length()));
					}
					System.out.println("files in profile_backup "+filelist1);
					System.out.println("files in ROOT/profile/ "+filelist2);
				} catch (SocketException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (IOException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				} catch (Exception e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
				if(filelist1.contains(photo[idx])|| filelist2.contains(photo[idx])) {
					photo[idx]=System.currentTimeMillis()+"_"+photo[idx];
				}
				
				File file = ftp_ivr.fileConvert(mFile);
				boolean result1;
				boolean result2;
				try {
					result1 = ftp_ivr.upload(file, "/tomcat/webapps/profile_backup/"+photo[idx]);
					result2 = ftp_ivr.upload(file, "/tomcat/webapps/ROOT/profile/"+photo[idx]);
					System.out.println("FTP upload Success to profile_backup: "+result1);
					System.out.println("FTP upload Success to profile : "+result2);
				} catch (SocketException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				if(photo[idx] != null && !photo[idx].equals("")) {
					if(new File(uploadPath+photo[idx]).exists()){
						photo[idx] = System.currentTimeMillis() + "_" + photo[idx];
					}
					try {					
						mFile.transferTo(new File(uploadPath+photo[idx]));
						System.out.println(idx+"서버 저장 : "+uploadPath+photo[idx]);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					}catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					photo[0] = "noimg.jpg";
				}
			}//if(photo[0]!="")			
			idx++;
		} // while
		System.out.println("your photo name (photo[0]): "+photo[0]);
		Members joinmember = new Members();
		joinmember.setMid(mRequest.getParameter("mId"));
		joinmember.setMpw(mRequest.getParameter("mPw1"));
		joinmember.setMname(mRequest.getParameter("mName"));
		joinmember.setAboutme(mRequest.getParameter("aboutme"));	
		joinmember.setMphoto(photo[0]);
		return memberDao.memberInsert(joinmember);		
	}

	@Override
	public int updateMphotoAboutme(Members member) {
		// TODO Auto-generated method stub
		return memberDao.updateMphotoAboutme(member);
	}

	@Override
	public int updateMphoto(Members member) {
		// TODO Auto-generated method stub
		return memberDao.updateMphoto(member);
	}

	@Override
	public int updateAboutme(Members member) {
		// TODO Auto-generated method stub
		return memberDao.updateAboutme(member);
	}

	@Override
	public int updateMpw(Members member) {
		// TODO Auto-generated method stub
		return memberDao.updateMpw(member);
	}

	@Override
	public int updateMdrop(String mid) {
		// TODO Auto-generated method stub
		return memberDao.updateMdrop(mid);
	}

	@Override
	public int profileHide(String mid) {
		// TODO Auto-generated method stub
		return memberDao.profileHide(mid);
	}

	@Override
	public int profileShow(String mid) {
		// TODO Auto-generated method stub
		return memberDao.profileShow(mid);
	}

	@Override
	public int getDrop(String mid) {
		// TODO Auto-generated method stub
		return memberDao.getDrop(mid);
	}

	@Override
	public int deleteMphoto(String mphoto) {
		// TODO Auto-generated method stub
		FtpClient ftp_ivr = new FtpClient("183.111.100.230", "nightsky", "cleanminded255@", "");
		boolean deleteResult1=false;
		boolean deleteResult2=false;
		int result=0;
		if(mphoto!="noimg.jpg") {
			try {
				deleteResult1= ftp_ivr.delete("/tomcat/webapps/profile_backup/"+mphoto);
				deleteResult2= ftp_ivr.delete("/tomcat/webapps/ROOT/profile/"+mphoto);
				System.out.println(mphoto+" has been deleted successfully[at profile_backup] : "+deleteResult1);
				System.out.println(mphoto+" has been deleted successfully[at ROOT/profile] : "+deleteResult2);
			} catch (SocketException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		if(deleteResult1==true && deleteResult2==true) {
			result=1;
		}
		return result;
	}

	@Override
	public int setPoint0(String mid) {
		// TODO Auto-generated method stub
		return memberDao.setPoint0(mid);
	}

}
