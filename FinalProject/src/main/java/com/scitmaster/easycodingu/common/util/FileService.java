package com.scitmaster.easycodingu.common.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 관련 유틸
 * 업로드한 파일의 저장 & 서버에 저장된 파일 삭제 등의 기능 제공
 */
public class FileService {
	
	/**
	 * 업로드 된 파일을 지정된 경로에 저장하고, 저장된 파일명을 리턴
	 * @param mfile 업로드된 파일
	 * @param path 저장할 경로
	 * @return 저장된 파일명
	 */
	public static String saveFile(MultipartFile mfile, String uploadPath) {
		//!static으로 만든 이유: 객체를 생성하지 않고도 쉽게 부르기 위해 
		//!static부르는 방법 : class.함수명
		//!multipart -> 사용자가 업로드한 파일
		//!uploadpath -> 저장할 경로
		
		//업로드된 파일이 없거나 크기가 0이면 저장하지 않고 null을 리턴
		//! 파일이 실제로 존재하는지 한번 더 체크
		if (mfile == null || mfile.isEmpty() || mfile.getSize() == 0) {
			return null;
		}
		
		//저장 폴더가 없으면 생성
		File path = new File(uploadPath);
			//! 파일 객체 안 쪽에 경로를 지정
		if (!path.isDirectory()) {	//저 경로에 폴더가 있는지 없는지 boolean으로 반환
				//폴더가 없으면 즉, false면
			path.mkdirs();
				//이걸 실행시켜라
				//파일 객체에 디렉토리를 만들어라. 
		}
		
		//원본 파일명
		String originalFilename = mfile.getOriginalFilename();
			//.getOriginalFilename()파일이 가지고 있는 파일명을 스트링 형태로 꺼내는 함수
		
		//저장할 파일명을 오늘 날짜의 년월일로 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			//Oracle의 to_char같은 클래스
			//자바에서 데이트 타입의 데이터가 있을 때, 
			//보여주고 싶은 형태로 보여주게 포맷을 만들어 지정 할 수 있는 함수
			//String 형태로 나온다. 
		String savedFilename = sdf.format(new Date());
		
		//원본 파일의 확장자
		String ext;
		int lastIndex = originalFilename.lastIndexOf('.');
			//확장자를 찾기위해 뒤에서부터 .을 찾는다. 
		//확장자가 없는 경우
		if (lastIndex == -1) {	//확장자가 없다는 뜻
			ext = "";
		}
		//확장자가 있는 경우
		else {
			ext = "." + originalFilename.substring(lastIndex + 1);
		}

		//저장할 전체 경로를 포함한 File 객체
			//FullPath를 가지고 있는 파일 객체
		File serverFile = null;
		
		//같은 이름의 파일이 있는 경우의 처리
		while (true) {
			serverFile = new File(uploadPath + "/" + savedFilename + ext);
				//uploadPath = /boardFile 컨트롤러에서 처음에 지정한 경로
				//savedFolename = 날짜로 생성한 파일명
				//ext = .확장자
				//세개를 합치면 전체 경로
			//같은 이름의 파일이 없으면 나감.
				//즉, 그 파일 이름을 써도 된다.
			if ( !serverFile.isFile()) break;	
			//같은 이름의 파일이 있으면 이름 뒤에 long 타입의 시간정보를 덧붙임.
				//파일명이 같으면 덮어씌워지니까 다시 파일명을 만들어야함. 
				//getTime() 현재 시간을 밀리세컨드로 꺼낸다. 유일한 파일명을 만들어내기 위한 처리
			savedFilename = savedFilename + new Date().getTime();	
		}		
		
		//파일 저장
		try {
			mfile.transferTo(serverFile);
			//스프링에서 제공해주는 함수
			//이것 만으로도 저장이 된다. 
			//안쪽에서 스트림을 열어서 알아서 작업을 해주고 있다.
			//만약 스프링이 아니라면 즉, 서블릿이거나 다른 프레임워크라면 
			//스트림을 열어서 다 써주면 된다. ...66ㅅ66
			//여기 주석처리하고 스트림 열어서 하는 걸로 해봐! 꼭! 8ㅅ8
		} catch (Exception e) {
			savedFilename = null;
			e.printStackTrace();
		}
		return savedFilename + ext;
	}
	
	/**
	 * 서버에 저장된 파일의 전체 경로를 전달받아, 해당 파일을 삭제
	 * @param fullpath 삭제할 파일의 경로
	 * @return 삭제 여부
	 */
	public static boolean deleteFile(String fullpath) {
			//fullpath => uploadPath + "/" + savedFilename + ext를 의미
		//파일 삭제 여부를 리턴할 변수
		boolean result = false;
		
		//전달된 전체 경로로 File객체 생성
		File delFile = new File(fullpath);
		
		//해당 파일이 존재하면 삭제
		if (delFile.isFile()) {
			delFile.delete();
			result = true;
		}
		return result;
	}
}
