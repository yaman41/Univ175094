package univelec.action;

import javax.servlet.http.HttpServletRequest;

import univelec.dao.DAOException;

public interface Action {

	public boolean check(HttpServletRequest req);
	public String execute(HttpServletRequest req) throws DAOException;
}
