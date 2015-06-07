package univelec.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import univelec.dao.DAOException;
import univelec.dao.ItemDAO;
import univelec.dto.CartDTO;

public class ConfirmCartAction implements Action{

	private int[] selectnums;

	@Override
	public boolean check(HttpServletRequest req) {
		String[] nums = req.getParameterValues("selectnums");
		selectnums = new int[nums.length];
		try{
			for(int i = 0;i < nums.length;i++){
				//System.out.println(nums[i]);
				selectnums[i] = Integer.parseInt(nums[i]);
			}
		}catch(NumberFormatException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public String execute(HttpServletRequest req) throws DAOException {
		HttpSession session = req.getSession(false);
		ItemDAO dao = new ItemDAO();
		ArrayList<CartDTO> cartlist = (ArrayList<CartDTO>)session.getAttribute("CartDTOList");
		for(int i = 0;i < cartlist.size();i ++){
			CartDTO dto = cartlist.get(i);
			int itemno = dto.getItemno();
			int totalcount = dto.getCount();
			if(dto.getCount() != this.selectnums[i]){
				// 注文数に変化あり
				totalcount = dto.getCount() + this.selectnums[i];
			}
			System.out.println(i);
			if(dao.checkStock(itemno, totalcount)){
				dto.setCount(totalcount);
			}else{
				req.setAttribute("ErrorMessage", "申し訳ございません。注文番号" + (i +1) + "は在庫不足です。再度入力して下さい");
				return "/page/U0401_Order.jsp";
			}
		}
		return "/page/U0402_Order.jsp";
	}

}
