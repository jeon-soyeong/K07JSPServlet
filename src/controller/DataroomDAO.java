package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.BbsDTO;

public class DataroomDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public DataroomDAO() {
	try {
		Context initCtx = new InitialContext();
		/*Context ctx = (Context)initCtx.lookup("java:comp/env");
		DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");*/
		
		//위 2번의 lookup을 아래 1번으로 병합할 수 있다.
		DataSource source = (DataSource)initCtx.lookup("java:comp/env/jdbc/myoracle");
		
		
		con = source.getConnection();
	}
	catch (Exception e) {
		System.out.println("DBCP 연결실패");
		e.printStackTrace();
	}
}	
	//자원반납하기 :  DB연결 자체를 끊는 것이 아니라 커넥션풀에 커넥션개체를 반납하는 것
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
		}
	}
	
	//자료실 게시판의 전체 레코드 갯수 카운트
	public int getTotalRecordCount(Map map) {

		int totalCount = 0;
		
		try {
		String sql = "SELECT COUNT(*) FROM dataroom";
		if(map.get("Word")!=null) {
			sql += " WHERE " + map.get("Column") + " "
					+ " LIKE '%" + map.get("Word") +"%'";
		}
		
			psmt = con.prepareStatement(sql);
			rs= psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {}
				
		return totalCount;
	}
	
	//게시물 리스트 출력하기(페이지처리X)
	public List<DataroomDTO> selectList(Map map){
		
		List<DataroomDTO> bbs = new Vector<DataroomDTO>();
		//기본쿼리문
		String sql = "SELECT * FROM dataroom";
		if(map.get("Word")!=null) {
			sql += " WHERE " + map.get("Column") +" "
					+ " LIKE '%" + map.get("Word") +"%'";
		}
		
		//최근게시물이 항상 위로 노출되야 하므로 작성된 순서의 역순으로 정렬한다.
		sql +=" ORDER BY idx DESC";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataroomDTO dto = new DataroomDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setAttachedfile(rs.getString(6));
				dto.setDowncount(rs.getInt(7));
				dto.setPass(rs.getString(8));
				dto.setVisitcount(rs.getInt(9));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bbs;
	}
	
	//자료실 글쓰기 처리
	public int insert(DataroomDTO dto) {
		
		int affected = 0;
		
		try {
			String sql = "INSERT INTO dataroom ("
					+ " idx,title,name,content,attachedfile,pass,downcount) "
					+ " VALUES ("
					+ " dataroom_seq.nextval,?,?,?,?,?,0)";
			System.out.println(sql);
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getAttachedfile());
			psmt.setString(5, dto.getPass());
			
			//insert성공시 '1', 실패시 '0' 반환
			affected = psmt.executeUpdate();		
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	//일련번호에 해당하는 게시물을 가져와서 DTO객체에 저장후 반환
		//자료실 게시물 상세보기
		public DataroomDTO selectView(String idx) {
			
			DataroomDTO dto = null;
			
			String sql = "SELECT * FROM dataroom WHERE idx=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, idx);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new DataroomDTO();
					
					dto.setIdx(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setPostdate(rs.getDate(5));
					dto.setAttachedfile(rs.getString(6));
					dto.setDowncount(rs.getInt(7));
					dto.setPass(rs.getString(8));
					dto.setVisitcount(rs.getInt(9));//조회수추가
				
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return dto;
		}
	
	//조회수 증가
	public void updateVisitCount(String idx) {
		String sql = "UPDATE dataroom SET "
				+" visitcount=visitcount+1 "
				+" WHERE idx=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeQuery();
		} catch (Exception e) {}
	}
	
	public boolean isCorrectPassword(String pass, String idx) {
		
		boolean isCorr = true;
		try {
			String sql = "SELECT COUNT(*) FROM dataroom WHERE pass=? AND idx=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, pass);
				psmt.setString(2, idx);
				rs = psmt.executeQuery();
				rs.next();
				if(rs.getInt(1)==0) {
					isCorr = false;
				}
		} catch (Exception e) {
			isCorr = false;
			e.printStackTrace();
		}
		return isCorr;
	}
	
	
	public int delete(String idx) {
		
		int affected = 0;
		try {
			String query = "DELETE FROM dataroom WHERE idx=?";
					
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			affected = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
