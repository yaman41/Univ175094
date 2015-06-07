import univelec.dao.DAOException;
import univelec.dao.ItemDAO;
import univelec.dao.OrderDAO;
import univelec.dto.OrderDTO;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		ItemDAO dao = new ItemDAO();
		OrderDAO odao = new OrderDAO();
		try{
			dao.serachAll();
			java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
			OrderDTO order = new OrderDTO(
					1,"aaa" , 5, 1, date
					);
			odao.addOrder(order);
			System.out.println(dao.checkStock(1, 150));
		}catch(DAOException e){
			e.printStackTrace();
		}
	}

}
