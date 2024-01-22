package like;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LikeDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static LikeDAO instance = new LikeDAO();
	public static LikeDAO getInstance() {
		return instance;
	}
	private LikeDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (SQLException e) {}
	}
	private LikeDTO mapping(ResultSet rs) throws SQLException {
		LikeDTO dto = new LikeDTO();
		dto.setMovie_idx(rs.getInt("movie_idx"));
		dto.setUserid(rs.getString("userid"));
		return dto;
	}
	// 좋아요인지 아닌지 불러오는 함수
	public LikeDTO selectLike(String userid, int movie_idx) {
		LikeDTO dto = null;
		String sql ="select * from like0 where userid = ? and movie_idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, movie_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	// 좋아요 아니면 insert
	public int insertLike(String userid, int movie_idx) {
		int row = 0;
		String sql = "insert into like0 values (?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, movie_idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	// 좋아요면 delete
	public int deleteLike(String userid, int movie_idx) {
		int row = 0;
		String sql = "delete from like0 where userid = ? and movie_idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setInt(2, movie_idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	public int count(int movie_idx) {
	      int count = 0;
	      String sql = "select count(*) from like0 "
	            + "   where"
	            + "       movie_idx = ?";
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, movie_idx);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            count = rs.getInt(1);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {close();}
	      return count;
	   }

	
}
