package univelec;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import univelec.action.Action;
import univelec.action.AddCartAction;
import univelec.action.CalcCartAction;
import univelec.action.ConfirmCartAction;
import univelec.action.DeleteCartAction;
import univelec.action.OrderAction;
import univelec.dao.DAOException;

/**
 * Servlet implementation class Controler
 */
@WebServlet("/controler")
public class Controler extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("Windows-31J");
		RequestDispatcher rd = null;
		String actionName = request.getParameter("action");

		if(actionName == null){
			System.out.println("aaa");
			rd = request.getRequestDispatcher("/page/U0302_Itemdisplay.jsp");
//			rd = request.getRequestDispatcher("/page/test.jsp");
		}else{
			System.out.println("bb");
			Action action = this.createAction(actionName);
			if(action != null){
				try{
					if(action.check(request)){
						String path = action.execute(request);
						rd = request.getRequestDispatcher(path);
					}else{
						rd = request.getRequestDispatcher("/page/checkerror.html");
					}
				}catch(DAOException e){
					e.printStackTrace();
					rd = request.getRequestDispatcher("/page/dberror.html");
				}
			}else{
				rd = request.getRequestDispatcher("/page/syserror.html");
			}
		}
		rd.forward(request, response);
	}

	private Action createAction(String name){
		if ( name.equals("RPU0401_Order")){
			return new AddCartAction();
		}else if (name.equals("RPU0402_Order")){
			return new CalcCartAction();
		}else if(name.equals("RPU0403_Order")){
			return new ConfirmCartAction();
		}else if(name.equals("RPU0404_Order")){
			return new DeleteCartAction();
		}else if(name.equals("RPU0405_Order")){
			return new OrderAction();
		}
		return null;
	}
}
