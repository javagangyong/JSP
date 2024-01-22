package board;

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

public class BoardDAO {

	private Context init;
	private DataSource ds;

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}

	private BoardDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if(rs != null) {rs.close();}
			if(pstmt != null) {pstmt.close();}
			if(conn != null) {conn.close();}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setContent(rs.getString("content"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setDeleted(rs.getInt("deleted"));
		dto.setIdx(rs.getInt("idx"));
		dto.setImg(rs.getString("img"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setViewCount(rs.getInt("viewCount"));
		return dto;
	}
	
	public List<BoardDTO> selectListBoard(String search, Paging paging) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select * from board0"
				+ "	where"
				+ "		deleted = 0 and"
				+ "		(title like '%' || ? || '%' or"
				+ "		content like '%' || ? || '%' or"
				+ "		writer like '%' || ? || '%')	"
				+ "	order by idx desc"
				+ " offset ? rows"
				+ " fetch next ? rows only";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setInt(4, paging.getOffset());
			pstmt.setInt(5, paging.getFetch());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return list;
	}
	
	public int selectCount(String search) {
		int count = 0;
		String sql = "select count(*) from board0"
				+ " where"
				+ "		deleted = 0 and"
				+ "		(title like '%' || ? || '%' or"
				+ "		writer like '%' || ? || '%' or"
				+ "		content like '%' || ? || '%')";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return count;
	}
	
	public int updateViewCount(int idx) {
		int row = 0;
		String sql = "update board0 set viewCount = viewCount + 1 where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return row;
	}
	
	public BoardDTO selectOneBoard(int idx) {
		String sql = "select * from board0 where idx = ?";
		BoardDTO dto = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return dto;
	}
	
	public int insert(BoardDTO dto) {
	      int row = 0;
	      String sql = "insert into board0 (title, content, img, writer) values (?, ?, ?, ?)";
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, dto.getTitle());
	         pstmt.setString(2, dto.getContent());
	         pstmt.setString(3, dto.getImg());
	         pstmt.setString(4, dto.getWriter());
	         row = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {close();}
	      return row;
	   }
	
	public int update(BoardDTO dto, int idx) {
		int row = 0;
		String sql = "update board0"
				+ " set "
				+ " 	title = ?,"
				+ " 	content = ?,"
				+ " 	img = ?"
				+ "	where "
				+ "		idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImg());
			pstmt.setInt(4, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return row;
	}
	
	public int delete(int idx) {
		int row = 0;
		String sql = "update board0 set deleted = 1 where idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return row;
	}
	public List<BoardDTO> selectListByWriter(String userid) {
		ArrayList<BoardDTO> list = new ArrayList<>();
		String sql = "select * from board0 where writer = ? order by idx desc";
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
