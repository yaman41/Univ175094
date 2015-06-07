package univelec.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CommonDAO {
	public Connection conn = null;
	private String driver = "org.postgresql.Driver";
	private String url = "jdbc:postgresql://localhost:5432/postgres";
	private String user = "postgres";
	private String pass = "postgres";

	public void init() throws DAOException {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw new DAOException();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DAOException();
		}
	}

	public void destroy() throws DAOException{
		try {
			if(conn != null){
				this.conn.close();
			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			throw new DAOException();
		}
	}
}
