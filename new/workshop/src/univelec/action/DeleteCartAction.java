package univelec.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import univelec.dao.DAOException;
import univelec.dto.CartDTO;

public class DeleteCartAction implements Action {

	private int index;

	@Override
	public boolean check(HttpServletRequest req) {
		// TODO 自動生成されたメソッド・スタブ
		try{
			this.index = Integer.parseInt(req.getParameter("index"));
		}catch(NumberFormatException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public String execute(HttpServletRequest req) throws DAOException {
		HttpSession session = req.getSession(false);
		ArrayList<CartDTO> cartlist = (ArrayList<CartDTO>)session.getAttribute("CartDTOList");
		cartlist.remove(this.index);
		int i = 0;
		for(CartDTO dto : cartlist){
			System.out.println(++i + ",,");
		}
		return "/page/U0401_Order.jsp";
	}
}
