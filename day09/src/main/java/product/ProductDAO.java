package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.OracleDriver;

public class ProductDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String name = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// DB연결 connection 로그인
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url, name, password);
	}
	
	// DB연결 차례대로 닫기
	private void close() {
		try {
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(conn != null) { conn.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// dto에 mapping
	private ProductDTO mapping(ResultSet rs) throws SQLException {
		ProductDTO dto = new ProductDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		return dto;
	}
	
	public List<ProductDTO> selectList() {
		ArrayList<ProductDTO> list = new ArrayList<>();
		String sql = "select * from product order by idx";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {close();}
		return list;
	}
	
	public int insert(ProductDTO dto) {
		int row = 0;
		String sql = "insert into product (name, price)"
				+ " values (?, ?)";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setInt(2, dto.getPrice());
				row = pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally { close(); }
		return row;
	}
	
	// 마지막으로 사용한 시퀀스 번호를 불러오는 함수
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from product";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return idx;
	}
	
	public ProductDTO selectOne(int idx) {
		ProductDTO dto = null;
		String sql = "select * from product where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}

}
