package univelec.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import univelec.dao.DAOException;
import univelec.dto.CartDTO;
import univelec.dto.ItemDTO;

public class AddCartAction implements Action{

	private int index;
	private int count;

	@Override
	public boolean check(HttpServletRequest req) {
		try{
			this.index = Integer.parseInt(req.getParameter("itemindex"));
			this.count = Integer.parseInt(req.getParameter("count"));
			System.out.println(index +":" + count);
		}catch(NumberFormatException e){
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public String execute(HttpServletRequest req) throws DAOException {
		HttpSession session = req.getSession(false);
		System.out.println("execute");
		ArrayList<ItemDTO> itemlist = (ArrayList<ItemDTO>)session.getAttribute("ItemDTOList");
		ItemDTO itemdto = itemlist.get(this.index);
		CartDTO cartdto = new CartDTO(itemdto.getNo(),itemdto.getName(), itemdto.getPrice(),
				itemdto.getCategory(), itemdto.getStock(), this.count);

		ArrayList<CartDTO> cartlist = (ArrayList<CartDTO>)session.getAttribute("CartDTOList");
		if(cartlist == null){
			ArrayList<CartDTO> newlist = new ArrayList<CartDTO>();
			System.out.println("execute2");
			if(itemdto.getStock() > this.count){
				newlist.add(cartdto); // カートに追加
				session.setAttribute("CartDTOList", newlist);
			}else{
				req.setAttribute("ErrorMessage", "申し訳ございません。商品"  + (this.index + 1) + "は在庫不足です。再度入力して下さい");
				return "/page/U0302_Itemdisplay.jsp";
			}
		}else{
			boolean flag = false;
			System.out.println("execute2");
			for(CartDTO dto : cartlist){
				if(dto.getItemno() == cartdto.getItemno()){
					int totalcount = dto.getCount() + this.count;
					if(dto.getStock() > totalcount){
						dto.setCount(totalcount);
						dto.setStock(dto.getStock() - dto.getCount());
						flag = true;
					}else{
						req.setAttribute("ErrorMessage", "申し訳ございません。商品"  + (this.index + 1) + "は在庫不足です。再度入力して下さい");
						return "/page/U0302_Itemdisplay.jsp";
					}
					break;
				}
			}
			// 被りなし
			if(flag == false){
				System.out.println("execute3");
				if(itemdto.getStock() > this.count){
					cartlist.add(cartdto);
				}else{
					req.setAttribute("ErrorMessage", "申し訳ございません。商品"  + (this.index + 1) + "は在庫不足です。再度入力して下さい");
					return "/page/U0302_Itemdisplay.jsp";
				}
			}
			session.setAttribute("CartDTOList", cartlist);
		}

		return "/page/U0401_Order.jsp";
	}



}
