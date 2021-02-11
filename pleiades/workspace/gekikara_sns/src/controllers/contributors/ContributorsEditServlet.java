package controllers.contributors;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Contributor;
import utils.DBUtil;

/**
 * Servlet implementation class ContributorsEditServlet
 */
@WebServlet("/contributors/edit")
public class ContributorsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContributorsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    EntityManager em =DBUtil.createEntityManager();
    Contributor e = em.find(Contributor.class, Integer.parseInt(request.getParameter("id")));

    em.close();

    request.setAttribute("contributor", e);
    request.setAttribute("_token", request.getSession().getId());
    request.getSession().setAttribute("contributor_id", e.getId());

    RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/contributors/edit.jsp");
    rd.forward(request,response);
    }

}
