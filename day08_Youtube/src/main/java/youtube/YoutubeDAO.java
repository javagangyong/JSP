package youtube;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class YoutubeDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url, user, password);
	}
	
	private void close() {
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
		}
	}
	
	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		dto.setChannel(rs.getString("channel"));
		dto.setIdx(rs.getInt("idx"));
		dto.setIframe(rs.getString("iframe"));
		dto.setThumbNail(rs.getString("thumbNail"));
		dto.setTitle(rs.getString("title"));
		return dto;
	}
	
	public List<YoutubeDTO> selectList() {
		ArrayList<YoutubeDTO> list = new ArrayList<YoutubeDTO>();
		String sql = "select * from youtube";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
}
