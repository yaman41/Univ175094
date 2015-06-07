package univelec.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemDAO extends CommonDAO{

	public void serachAll() throws DAOException{
		PreparedStatement query = null;
		ResultSet rs = null;
		try{
			super.init();
			query = super.conn.prepareStatement("select * from itemtbl");
			rs = query.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString(2));
			}

		}catch(SQLException e){
			e.printStackTrace();
			throw new DAOException();
		}finally{
			super.destroy();
		}
	}

	public boolean checkStock(int no, int count)throws DAOException{
		PreparedStatement query = null;
		ResultSet rs = null;
		try{
			super.init();
			query = super.conn.prepareStatement("SELECT stock FROM itemtbl WHERE no = ?");
			query.setInt(1, no);
			rs = query.executeQuery();
			int stock = 0;
			if(rs.next()){
				stock = rs.getInt(1);
			}else{
				return false;
			}
			if(count <= stock){
				return true;
			}else{
				return false;
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw new DAOException();
		}finally{
			super.destroy();
		}
	}

	public int updateStock(int no, int count) throws DAOException{
		PreparedStatement query = null;
		ResultSet rs = null;
		try{
			super.init();
			query = super.conn.prepareStatement("SELECT stock FROM itemtbl WHERE no = ?");
			query.setInt(1, no);
			rs = query.executeQuery();
			int resultstock = 0;
			if(rs.next()){
				resultstock = rs.getInt(1);
			}else{
				return -1;
			}

			resultstock -= count;
			query = super.conn.prepareStatement("UPDATE itemtbl SET stock = ? WHERE no = ?");
			query.setInt(1, resultstock);
			query.setInt(2, no);
			return query.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DAOException();
		}finally{
			super.destroy();
		}
	}
}
