package ctrl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.BbsData;
import model.User;
import model.WebData;
import model.wwRecord;
import util.ExFileName;

/**
 * Servlet implementation class CenterController
 */
// 赵旭的xu
@WebServlet("*.xu")
@MultipartConfig
public class XuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		String path = request.getServletPath();
		// System.out.println(path);
		HttpSession session = request.getSession();
		if (path.equals("/index.xu")) {
			// 首页
			request.getRequestDispatcher("/user/login.jsp").forward(request, response);

		} else if (path.equals("/register.xu")) {
			// 注册
			// 获取用户输入的三个值
			String un = request.getParameter("un");
			String pw = request.getParameter("pw");
			String nn = request.getParameter("nn");
			// 调用模型
			String a = null;

			// 判断用户名是否存在
			for (String aaa : new User().SUN(un).values()) {
				a = aaa;
			}
			if (a.equals("0")) {
				// 判断昵称是否存在
				String b = null;
				for (String aaa : new User().SUN(un).values()) {
					b = aaa;
				}
				if (b.equals("0")) {
					int r = new User().register(un, pw, nn);
					if (r == 1) {
						request.setAttribute("title", "恭喜您");
						request.setAttribute("msg", "注册成功，请登录！");
					} else {
						request.setAttribute("title", "注册错误");
						request.setAttribute("msg", "注册失败！");
					}
				} else {
					request.setAttribute("title", "注册错误");
					request.setAttribute("msg", "用户名已存在！");
				}

			} else {
				request.setAttribute("title", "注册错误");
				request.setAttribute("msg", "昵称已存在！");
			}

			// 请求转发
			request.setAttribute("href", "index.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/login.xu")) {
			// 登录
			String un = request.getParameter("un");
			String pw = request.getParameter("pw");
			// 调用模型
			String r = new User().login(un, pw);
			if (r.equals("-1")) {
				// 登录失败
				request.setAttribute("msg", "用户名或密码错误，请重新登录!");
				request.setAttribute("href", "index.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			} else {
				// 登录成功
				String nn = new User().getNinkName(un);
				session.setAttribute("nn", nn);
				session.setAttribute("un", un);
				if (r.equals("1")) {
					session.setAttribute("qdl", "2");
					request.getRequestDispatcher("/user/login.jsp").forward(request, response);
				} else {
					session.setAttribute("qdl", "1");
					request.getRequestDispatcher("/user/login.jsp").forward(request, response);
				}
			}

		} else if (path.equals("/home.xu")) {
			// 主页
			BbsData b = new BbsData();
			request.setAttribute("bbsData2", b.showBbs2());
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb());
			request.getRequestDispatcher("/user/homepage.jsp").forward(request, response);

		} else if (path.equals("/bbs.xu")) {
			// 留言板
			BbsData b = new BbsData();
			request.setAttribute("bbsCount", b.getCount());
			request.setAttribute("bbsData", b.showBbs());
			request.getRequestDispatcher("/user/bbs.jsp").forward(request, response);

		} else if (path.equals("/byebye.xu")) {
			// 退出登陆
			session.setAttribute("qdl", "0");
			request.getRequestDispatcher("home.xu").forward(request, response);
		} else if (path.equals("/yk.xu")) {
			// 游客模式
			session.setAttribute("qdl", "0");
			BbsData b = new BbsData();
			request.setAttribute("bbsData2", b.showBbs2());
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb());
			request.getRequestDispatcher("home.xu").forward(request, response);
		} else if (path.equals("/putbbs.xu")) {
			// 留言
			String nn = request.getParameter("nn");
			String bss = request.getParameter("bbss");
			if (bss != null && !bss.equals("")) {
				int r = new BbsData().putBbs(nn, bss);
				if (r == 1) {
					// 留言成功
					response.sendRedirect("bbs.xu");

				} else {
					// 留言失败
					request.setAttribute("title", "留言错误");
					request.setAttribute("msg", "留言失败，请检查输入是否合法!");
					request.setAttribute("href", "bbs.xu");
					request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
				}
			} else {
				// 留言失败
				request.setAttribute("title", "留言错误");
				request.setAttribute("msg", "啥都没写留啥哇!");
				request.setAttribute("href", "bbs.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			}

		} else if (path.equals("/my.xu")) {
			// 我的页面
			Map<String, String> r = new User().getUsers(session.getAttribute("un").toString());
			request.setAttribute("Users", r);
			request.getRequestDispatcher("/user/user_my.jsp").forward(request, response);

		} else if (path.equals("/upUser.xu")) {
			// 修改密码
			String un = request.getParameter("un");
			String npw = request.getParameter("npw");
			String npw2 = request.getParameter("npw2");

			if (npw.equals(npw2) && !npw.equals(null) && npw != "") {
				int r = new User().upUser(un, npw);
				if (r == 1) {
					request.setAttribute("title", "提示");
					request.setAttribute("msg", "密码更新成功！");
				} else {
					request.setAttribute("title", "提示");
					request.setAttribute("msg", "密码更新失败！");
				}
				request.setAttribute("href", "my.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			} else {
				request.setAttribute("title", "提示");
				request.setAttribute("msg", "您没有输入或输入不一致！");
				request.setAttribute("href", "my.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			}

		} else if (path.equals("/wantPutWeb.xu")) {
			// 申请页面
			wwRecord w = new wwRecord();
			request.setAttribute("wwRecord", w.showwR());
			Map<String, String> r = new User().getUsers(session.getAttribute("un").toString());
			request.setAttribute("Users", r);

			request.getRequestDispatcher("/user/wantPutWeb.jsp").forward(request, response);

		} else if (path.equals("/upload.xu")) {
			// 上传文件
			String wwNN = request.getParameter("nn");
			String wwName = request.getParameter("wwName");
			String wwAuthor = request.getParameter("wwAuthor");
			String wwPs = request.getParameter("wwPs");
			String wwBz = request.getParameter("wwBz");
			wwRecord ww = new wwRecord();
			ww.putRecord(wwNN, wwName, wwAuthor, wwPs, wwBz);
			Part file = request.getPart("file");
			// 文件上传，返回文件上传路径
			String path616 = uploadFile(file, request);

			request.setAttribute("title", "申请成功");
			request.setAttribute("msg", "申请成功，请等待审核，路径为：" + path616);
			request.setAttribute("href", "wantPutWeb.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/readFirst.xu")) {
			// 申请说明
			response.sendRedirect("readFirst.jsp");

		} else if (path.equals("/kzt.xu")) {
			// 主页

			User u = new User();
			request.setAttribute("Users", u.showwUser());

			request.getRequestDispatcher("/guang/guang.jsp").forward(request, response);

		} else if (path.equals("/guang_webdata.xu")) {
			// 网站列表
			wwRecord w = new wwRecord();
			request.setAttribute("wwRecord", w.showwRR());
			request.getRequestDispatcher("/guang/guang_webdata.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_yes.xu")) {
			// 通过申请
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_Yes(id);
			if (r == 1) {
				request.setAttribute("title", "审核成功");
				request.setAttribute("msg", "申请审核成功！");
			} else {
				request.setAttribute("title", "审核成功");
				request.setAttribute("msg", "申请审核失败！");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_no.xu")) {
			// 驳回申请
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_No(id);
			if (r == 1) {
				request.setAttribute("title", "审核成功");
				request.setAttribute("msg", "申请驳回成功！");
			} else {
				request.setAttribute("title", "审核成功");
				request.setAttribute("msg", "申请驳回失败！");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_del.xu")) {
			// 网站删除操作
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_Del(id);
			if (r == 1) {
				request.setAttribute("title", "操作成功");
				request.setAttribute("msg", "删除成功！");
			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "删除失败！");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_user_del.xu")) {
			// 用户删除操作
			String id = request.getParameter("id");
			User u = new User();
			int r = u.userDel(id);
			if (r == 1) {
				request.setAttribute("title", "操作成功");
				request.setAttribute("msg", "删除成功！");
			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "删除失败！");
			}
			request.setAttribute("href", "kzt.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/guang_bbs.xu")) {
			// 留言列表
			BbsData b = new BbsData();
			request.setAttribute("bbsData", b.showBbs());
			request.getRequestDispatcher("/guang/guang_bbs.jsp").forward(request, response);
		} else if (path.equals("/guang_bbs_del.xu")) {
			// 删除留言
			String id = request.getParameter("id");
			BbsData bb = new BbsData();
			int r = bb.bbsDel(id);
			if (r == 1) {
				request.setAttribute("title", "操作成功");
				request.setAttribute("msg", "删除成功！");
			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "删除失败！");
			}
			request.setAttribute("href", "guang_bbs.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/guang_web.xu")) {
			// 网站列表
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb2());
			request.getRequestDispatcher("/guang/guang_web.jsp").forward(request, response);
		} else if (path.equals("/up616.xu")) {
			// 上传616页面
			request.getRequestDispatcher("/guang/guang_up616.jsp").forward(request, response);
		} else if (path.equals("/guang_upWAR.xu")) {
			// 上传WAR包操作

			Part filee = request.getPart("file");
			// 文件上传，返回文件上传路径
			String path616 = upWAR(filee, request);
			request.setAttribute("title", "okokokk");
			request.setAttribute("msg", "网站更新成功：" + path616);
			request.setAttribute("href", "up616.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		
		
		
		} else if (path.equals("/guang_putDongxi.xu")) {
			// 上传其他文件操作

			Part filee2 = request.getPart("file2");
			// 文件上传，返回文件上传路径
			String path616 = upOtherFile(filee2, request);
			request.setAttribute("title", "okokokk");
			request.setAttribute("msg", "丢丢丢~丢上去了：" + path616);
			request.setAttribute("href", "up616.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);	
		}
		
		
		else if (path.equals("/add_web.xu")) {
			// 添加网站
			String webName = request.getParameter("wName");
			String webAuthor = request.getParameter("wAuthor");
			String webPs = request.getParameter("wPs");
			String webUrl = request.getParameter("wUrl");
			String webIcon = request.getParameter("wIcon");
			if (!webName.equals("") && !webAuthor.equals("")) {
				WebData w = new WebData();
				int r = w.putWebs(webName, webAuthor, webPs, webUrl, webIcon);
				if (r == 1) {
					request.setAttribute("title", "操作成功");
					request.setAttribute("msg", "添加成功！");
				} else {
					request.setAttribute("title", "操作失败");
					request.setAttribute("msg", "添加失败！");
				}
				request.setAttribute("href", "guang_web.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "输入不能为空！");
				request.setAttribute("href", "guang_web.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			}
		} else if (path.equals("/web_del.xu")) {
			// 删除网站
			String id = request.getParameter("id");
			WebData w = new WebData();
			int r = w.webDel(id);
			if (r == 1) {
				request.setAttribute("title", "操作成功");
				request.setAttribute("msg", "删除成功！");
			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "删除失败！");
			}
			request.setAttribute("href", "guang_web.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/web_edit.xu")) {
			// 网站更新页面
			String id = request.getParameter("id");
			WebData w = new WebData();
			request.setAttribute("webData", w.getWebByid(id));
			request.getRequestDispatcher("/guang/guang_web_edit.jsp").forward(request, response);

		} else if (path.equals("/editWebs.xu")) {
			// 更新网站
			String id = request.getParameter("webId");
			String webName = request.getParameter("webName");
			String webAuthor = request.getParameter("webAuthor");
			String webPs = request.getParameter("webPs");
			String webUrl = request.getParameter("webUrl");
			String webIcon = request.getParameter("webIcon");
			WebData w = new WebData();
			int r = w.editWeb(webName, webAuthor, webPs, webUrl, webIcon, id);
			if (r == 1) {
				request.setAttribute("title", "操作成功");
				request.setAttribute("msg", "修改成功！");
			} else {
				request.setAttribute("title", "操作失败");
				request.setAttribute("msg", "修改失败！");
			}
			request.setAttribute("href", "guang_web.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		}

		/* 最后的大括号 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	// 用户上传申请文件
	private String uploadFile(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// 得到上传文件的文件扩展名
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// 得到上传文件的保存路径
			String savePath = request.getServletContext().getRealPath("/WEB-INF/wwRecord");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdir();
			}
			// 文件上传
			try {
				part.write(savePath + File.separator + fileName);
				path616 = "/WEB-INF/wwRecord/" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "上传失败！";
			}
		}
		return path616;

	}
	// 上传WAR包
	private String upWAR(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// 得到上传文件的文件扩展名
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// 得到上传文件的保存路径
           String sysPath = System.getProperty("user.dir"); 
			File f = new File(sysPath+"/webapps");
			if (!f.exists()) {
				f.mkdir();
			}
			// 文件上传
			try {
				part.write(sysPath+"/webapps" + File.separator + fileName);
				path616 = "" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "上传失败！";
			}
		}
		return path616;

	}
	
	
	// 上传其他文件
	private String upOtherFile(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// 得到上传文件的文件扩展名
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// 得到上传文件的保存路径
			String savePath = request.getServletContext().getRealPath("/WEB-INF/others/");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdir();
			}
			// 文件上传
			try {
				part.write(savePath + File.separator + fileName);
				path616 = "/WEB-INF/others/" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "上传失败！";
			}
		}
		return path616;

	}
}