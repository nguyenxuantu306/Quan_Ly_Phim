package com.poly.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.constant.SessionAttr;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.VideoService;
import com.poly.service.impl.VideoServiceImpl;

@WebServlet(urlPatterns = {"/admin/video"}, name = "VideoControllerOfAdmin")
public class VideoController extends HttpServlet{

	private static final long serialVersionUID = 3968414433292121855L;
	
	private VideoService videoService = new VideoServiceImpl(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "views": 
				doGetOverView(req, resp);
				break;
			case "delete": 
				doGetDelete(req, resp);
				break;
			case "add":
				req.setAttribute("isEdit", false);
				doGetAdd(req, resp);
				break;
			case "edit": 
				req.setAttribute("isEdit", true);
				doGetEdit(req, resp);
				break;
			}
		}else {
			resp.sendRedirect("index");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User currentUser = (User) session.getAttribute(SessionAttr.CURRENT_USER);
		if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
			String action = req.getParameter("action");
			switch (action) {
			case "add": 
				doPostAdd(req, resp);
				break;
			case "edit": 
				doPostEdit(req, resp);
				break;
			}
		}else {
			resp.sendRedirect("index");
		}
	}
	

	private void doGetOverView(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Video> videos = videoService.findAll();
		req.setAttribute("videos", videos);
		req.getRequestDispatcher("/views/admin/video-overview.jsp").forward(req, resp);
	}
	
	private void doGetDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("application/json");
		String href = req.getParameter("href");
		Video videoDeleted = videoService.detele(href);
		if (videoDeleted != null) {
			resp.setStatus(204);
		}else {
			resp.setStatus(400);
		}
	}
	
	private void doGetAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
	}
	
	private void doGetEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String href = req.getParameter("href");
		Video videos = videoService.findByHref(href);
		req.setAttribute("video", videos);
		req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
	}
	
	private void doPostAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("application/json");
	    String title = req.getParameter("title");
	    String href = req.getParameter("href");
	    String description = req.getParameter("description");
	    String poster = req.getParameter("poster");

	    Video videos = new Video();
	    videos.setTitle(title);
	    videos.setHref(href);
	    videos.setDescription(description);
	    videos.setPoster(poster);

	    Video videoReturn = videoService.create(videos);
	    if (videoReturn != null) {
	        resp.setStatus(204);
	    } else {
	        resp.setStatus(400);
	    }
	}
	
	private void doPostEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    resp.setContentType("application/json");
	    String title = req.getParameter("title");
	    String href = req.getParameter("newHref");
	    String description = req.getParameter("description");
	    String poster = req.getParameter("poster");
	    String hrefOrgin = req.getParameter("hrefOrigin");

	    Video videos = videoService.findByHref(hrefOrgin);
	    videos.setTitle(title);
	    videos.setHref(href);
	    videos.setDescription(description);
	    videos.setPoster(poster);

	    Video videoReturn = videoService.update(videos);
	    if (videoReturn != null) {
	        resp.setStatus(204);
	    } else {
	        resp.setStatus(400);
	    }
	}

}
