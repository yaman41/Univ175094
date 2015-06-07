package univelec.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import univelec.dto.OrderDTO;

public class OrderDAO extends CommonDAO{

	public int addOrder(OrderDTO dto) throws DAOException{
		PreparedStatement query = null;
		ResultSet rs = null;
		try{
			super.init();
			query = super.conn.prepareStatement("SELECT NEXTVAL('orderno')");
			rs = query.executeQuery();
			if(rs.next()){
				dto.setNo(rs.getInt(1));
			}else{
				return -1;
			}

			query = super.conn.prepareStatement("INSERT INTO ordertbl(no,itemno,itemname,count,usercode,orderdate) VALUES(?,?,?,?,?,?)");
			query.setInt(1, dto.getNo());
			query.setInt(2, dto.getItemno());
			query.setString(3, dto.getItemname());
			query.setInt(4, dto.getCount());
			query.setInt(5, dto.getUsercode());
			query.setTimestamp(6, dto.getDate());
			return query.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
			throw new DAOException();
		}finally{
			super.destroy();
		}
	}
}
