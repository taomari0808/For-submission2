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
 * Servlet implementation class ContributorsShowServlet
 */
@WebServlet("/contributors/show")
public class ContributorsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContributorsShowServlet() {
        super();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    EntityManager em =DBUtil.createEntityManager();

    Contributor e = em.find(Contributor.class, Integer.parseInt(request.getParameter("id")));


    em.close();

    request.setAttribute("contributor",e);

            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/contributors/show.jsp");
            rd.forward(request,response);
    }
    }


