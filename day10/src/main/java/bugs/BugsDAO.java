package bugs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class BugsDAO {
	// 싱글톤 : 페이지마다 같은 기능을 하는 서로 다른 객체가 생기지 않도록 처리
	//		modify, view, delete, insert 에서 사용하는 dao가 모두 다른객체이다. 비효율적.
	// 생성자
	
	// 멤버 필드
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	
	// 내부 함수
	// Connection getConnection()
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url, user, password);
	}
	
	// void close()
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch(SQLException e) {}
	}
	
	// BugsDTO mapping(ResultSet rs)
	private BugsDTO mapping(ResultSet rs) throws SQLException {
		BugsDTO dto = new BugsDTO();
		dto.setId(rs.getInt("id"));
		dto.setArtist_name(rs.getString("artist_name"));
		dto.setArtist_img(rs.getString("artist_img"));
		dto.setAlbum_name(rs.getString("album_name"));
		dto.setAlbum_img(rs.getString("album_img"));
		dto.setName(rs.getString("name"));
		dto.setGenre(rs.getString("genre"));
		dto.setPlayTime(rs.getInt("playTime"));
		dto.setLyrics(rs.getString("lyrics"));
		dto.setIsTitle(rs.getInt("isTitle"));
		return dto;
	}
	
	// 공개 함수
	// List<BugsDTO> selectAll()
	// select * from bugs order by artist_name, id;
	public List<BugsDTO> selectAll(String search) {
		ArrayList<BugsDTO> list = new ArrayList<BugsDTO>();
		String sql = "select * from bugs "
				+ " where"
				+ "		name like '%' || ? || '%'"
				+ "		or"
				+ "		artist_name like '%' || ? || '%'"
				+ "order by artist_name, id";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {close();}
		System.out.println("불러온 목록의 개수 : " + list.size());
		return list;
	}
	
	
	// List<BugsDTO> selectListBySearch(String search)
	// select * from bugs where 
	//		name like '%' || ? || '%'
	//		or artist_name like '%' || ? || '%'
	
	// BugsDTO selectOne(int id)
	// select * from bugs where id = ?
	// ======================================== 여기까지 executeQuery()	ResultSet 함수 	mapping(rs)
	public BugsDTO selectOne(int id) {
		BugsDTO dto = null;
		String sql = "select * from bugs where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	
	// int insert(BugsDTO dto)
	// insert into bugs (...) values (?, ...)
	public int insert(BugsDTO dto) {
		int row = 0;
		String sql = "insert into bugs ("
				+ "		artist_name,"
				+ "		album_name,"
				+ "		name,"
				+ "		genre,"
				+ "		playTime,"
				+ "		isTitle,"
				+ "		lyrics"
				+ ") values ("
				+ "		?, ?, ?, ?, ?, ?, ?"
				+ ")";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getArtist_name());
			pstmt.setString(2, dto.getAlbum_name());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGenre());
			pstmt.setInt(5, dto.getPlayTime());
			pstmt.setInt(6, dto.getIsTitle());
			pstmt.setString(7, dto.getLyrics());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	
	// int update(BugsDTO dto)
	// update bugs set artist_name=?, ... where id = ?
	public int update(BugsDTO dto) {
		int row = 0;
		String sql = "update bugs"
				+ "		set"
				+ "			artist_name = ?,"
				+ "			album_name = ?,"
				+ "			name = ?,"
				+ "			genre = ?,"
				+ "			playTime = ?,"
				+ "			isTitle = ?,"
				+ "			lyrics = ?"
				+ "		where"
				+ "			id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getArtist_name());
			pstmt.setString(2, dto.getAlbum_name());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getGenre());
			pstmt.setInt(5, dto.getPlayTime());
			pstmt.setInt(6, dto.getIsTitle());
			pstmt.setString(7, dto.getLyrics());
			pstmt.setInt(8, dto.getId());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// int delete(int id)
	// delete from bugs where id = ?
	// ======================================== executeUpdate()		반환은 int
	public int delete(int id) {
		int row = 0;
		String sql = "delete from bugs where id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
}
