package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MovieDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MovieDAO instance = new MovieDAO();
	public static MovieDAO getInstance() {
		return instance;
	}
	private MovieDAO() {
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
	private MovieDTO mapping(ResultSet rs) throws SQLException {
		MovieDTO dto = new MovieDTO();
		dto.setActor(rs.getString("actor"));
		dto.setContent(rs.getString("content"));
		dto.setGenre(rs.getString("genre"));
		dto.setIdx(rs.getInt("idx"));
		dto.setPoster(rs.getString("poster"));
		dto.setReleaseDate(rs.getString("releaseDate"));
		dto.setTitle(rs.getString("title"));
		dto.setMent(rs.getString("ment"));
		dto.setPerson(rs.getString("person"));
		dto.setScore(rs.getString("score"));
		dto.setTrailer(rs.getString("trailer"));
		return dto;
	}
	// 영화 인기 top4 (selectListBestMovie)
	// select * from movie0;
	public List<MovieDTO> selectListBestMovie() {
		ArrayList<MovieDTO> list = new ArrayList<>();
		String sql = "select * from movie0 order by idx fetch next 5 rows only ";
		try {
			conn = ds.getConnection();
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
	// 최신 영화 목록 (selectListMovie)
	// select * from movie0;
	public List<MovieDTO> selectListMovie() {
		ArrayList<MovieDTO> list = new ArrayList<>();
		String sql = "select * from movie0 order by idx";
		try {
			conn = ds.getConnection();
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
	// 영화별 상세정보 (selectOneList)
	public MovieDTO selectOneList(int idx) {
		MovieDTO dto = null;
		String sql = "select * from movie0 where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
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
	// 내가 좋아요 한 영화목록 불러오기
	public List<MovieDTO> selectListLikeMovie(String userid) {
		ArrayList<MovieDTO> list = new ArrayList<>();
		String sql = "select movie0.* from movie0, like0 where movie0.idx = like0.movie_idx and userid = ? order by idx"
				+ " offset 0 rows "
				+ " fetch next 10 rows only";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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
