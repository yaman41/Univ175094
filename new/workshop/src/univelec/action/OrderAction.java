package univelec.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import univelec.dao.DAOException;
import univelec.dao.ItemDAO;
import univelec.dao.OrderDAO;
import univelec.dto.CartDTO;
import univelec.dto.OrderDTO;
import univelec.dto.UserDTO;

public class OrderAction implements Action{
	@Override
	public boolean check(HttpServletRequest req) {
		// TODO 自動生成されたメソッド・スタブ
		return true;
	}

	@Override
	public String execute(HttpServletRequest req) throws DAOException {
		HttpSession session = req.getSession(false);
		ItemDAO dao = new ItemDAO();
		ArrayList<CartDTO> cartlist = (ArrayList<CartDTO>)session.getAttribute("CartDTOList");
		java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
		UserDTO userdto = (UserDTO)session.getAttribute("UserDTO");
		ArrayList<OrderDTO> orderlist = new ArrayList<OrderDTO>();
		for(int i = 0;i < cartlist.size(); i++){
			CartDTO dto = cartlist.get(i);
			int no = dto.getItemno();
			int totalcount = dto.getCount();
			if(dao.checkStock(no, totalcount) == false){
				// 在庫不足
				req.setAttribute("ErrorMessage", "申し訳ございません。注文番号" + (i +1) + "は在庫不足です。再度入力して下さい。");
				return "/page/U0401_Order.jsp";
			}

			OrderDTO order = new OrderDTO(
					dto.getItemno(), dto.getItemname(), dto.getCount(),
					userdto.getCode(), date
					);
			orderlist.add(order);
		}

		OrderDAO orderdao = new OrderDAO();
		for(OrderDTO dto : orderlist){
			orderdao.addOrder(dto);
			dao.updateStock(dto.getItemno(), dto.getCount());
		}

		session.setAttribute("newOrderDTO", orderlist); // 注文リストの作成
		session.removeAttribute("CartDTOList"); // カートの削除

		return "/page/U0403_Order.jsp";
	}
}
