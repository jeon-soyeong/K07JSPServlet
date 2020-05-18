package util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {
	
	public static MultipartRequest upload(HttpServletRequest req, String saveDirectory) {
		
		
		MultipartRequest mr = null;
		/*
		  매개변수1 : 사용자 요청 정보가 저장된 request 내장객체
		  매개변수2 :  파일이 업로드될 서버의 물리적 경로
		  그 외 업로드할 파일의 최대용량, 인코딩방식, 파일명 중복을 처리할 클래스
		  통해 MultipartRequest객체를 생성한다.
		  객체생성이 정상적으로 되면 파일업로드는 완료된다.
		 */
		try {
			mr = new MultipartRequest(req,
					saveDirectory,
					1024*1024,
					"UTF-8",
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mr;
	}
	
	//물리적 경로에 저장된 파일을 삭제처리
	public static void deleteFile(HttpServletRequest req, String directory, String fileName) {
		//물리적 경로 가져오기
		String saveDirectory = 
				req.getServletContext().getRealPath(directory);
		
		//물리적 경로를 토대로 파일객체 생성
		File f = new File(saveDirectory+File.separator+fileName);
		
		//만약 해당 파일이 존재한다면 삭제처리
		if(f.exists()) {
			f.delete();
		}
	}
	
}
