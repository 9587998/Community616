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
// �����xu
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
			// ��ҳ
			request.getRequestDispatcher("/user/login.jsp").forward(request, response);

		} else if (path.equals("/register.xu")) {
			// ע��
			// ��ȡ�û����������ֵ
			String un = request.getParameter("un");
			String pw = request.getParameter("pw");
			String nn = request.getParameter("nn");
			// ����ģ��
			String a = null;

			// �ж��û����Ƿ����
			for (String aaa : new User().SUN(un).values()) {
				a = aaa;
			}
			if (a.equals("0")) {
				// �ж��ǳ��Ƿ����
				String b = null;
				for (String aaa : new User().SUN(un).values()) {
					b = aaa;
				}
				if (b.equals("0")) {
					int r = new User().register(un, pw, nn);
					if (r == 1) {
						request.setAttribute("title", "��ϲ��");
						request.setAttribute("msg", "ע��ɹ������¼��");
					} else {
						request.setAttribute("title", "ע�����");
						request.setAttribute("msg", "ע��ʧ�ܣ�");
					}
				} else {
					request.setAttribute("title", "ע�����");
					request.setAttribute("msg", "�û����Ѵ��ڣ�");
				}

			} else {
				request.setAttribute("title", "ע�����");
				request.setAttribute("msg", "�ǳ��Ѵ��ڣ�");
			}

			// ����ת��
			request.setAttribute("href", "index.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/login.xu")) {
			// ��¼
			String un = request.getParameter("un");
			String pw = request.getParameter("pw");
			// ����ģ��
			String r = new User().login(un, pw);
			if (r.equals("-1")) {
				// ��¼ʧ��
				request.setAttribute("msg", "�û�����������������µ�¼!");
				request.setAttribute("href", "index.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			} else {
				// ��¼�ɹ�
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
			// ��ҳ
			BbsData b = new BbsData();
			request.setAttribute("bbsData2", b.showBbs2());
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb());
			request.getRequestDispatcher("/user/homepage.jsp").forward(request, response);

		} else if (path.equals("/bbs.xu")) {
			// ���԰�
			BbsData b = new BbsData();
			request.setAttribute("bbsCount", b.getCount());
			request.setAttribute("bbsData", b.showBbs());
			request.getRequestDispatcher("/user/bbs.jsp").forward(request, response);

		} else if (path.equals("/byebye.xu")) {
			// �˳���½
			session.setAttribute("qdl", "0");
			request.getRequestDispatcher("home.xu").forward(request, response);
		} else if (path.equals("/yk.xu")) {
			// �ο�ģʽ
			session.setAttribute("qdl", "0");
			BbsData b = new BbsData();
			request.setAttribute("bbsData2", b.showBbs2());
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb());
			request.getRequestDispatcher("home.xu").forward(request, response);
		} else if (path.equals("/putbbs.xu")) {
			// ����
			String nn = request.getParameter("nn");
			String bss = request.getParameter("bbss");
			if (bss != null && !bss.equals("")) {
				int r = new BbsData().putBbs(nn, bss);
				if (r == 1) {
					// ���Գɹ�
					response.sendRedirect("bbs.xu");

				} else {
					// ����ʧ��
					request.setAttribute("title", "���Դ���");
					request.setAttribute("msg", "����ʧ�ܣ����������Ƿ�Ϸ�!");
					request.setAttribute("href", "bbs.xu");
					request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
				}
			} else {
				// ����ʧ��
				request.setAttribute("title", "���Դ���");
				request.setAttribute("msg", "ɶ��ûд��ɶ��!");
				request.setAttribute("href", "bbs.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			}

		} else if (path.equals("/my.xu")) {
			// �ҵ�ҳ��
			Map<String, String> r = new User().getUsers(session.getAttribute("un").toString());
			request.setAttribute("Users", r);
			request.getRequestDispatcher("/user/user_my.jsp").forward(request, response);

		} else if (path.equals("/upUser.xu")) {
			// �޸�����
			String un = request.getParameter("un");
			String npw = request.getParameter("npw");
			String npw2 = request.getParameter("npw2");

			if (npw.equals(npw2) && !npw.equals(null) && npw != "") {
				int r = new User().upUser(un, npw);
				if (r == 1) {
					request.setAttribute("title", "��ʾ");
					request.setAttribute("msg", "������³ɹ���");
				} else {
					request.setAttribute("title", "��ʾ");
					request.setAttribute("msg", "�������ʧ�ܣ�");
				}
				request.setAttribute("href", "my.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			} else {
				request.setAttribute("title", "��ʾ");
				request.setAttribute("msg", "��û����������벻һ�£�");
				request.setAttribute("href", "my.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			}

		} else if (path.equals("/wantPutWeb.xu")) {
			// ����ҳ��
			wwRecord w = new wwRecord();
			request.setAttribute("wwRecord", w.showwR());
			Map<String, String> r = new User().getUsers(session.getAttribute("un").toString());
			request.setAttribute("Users", r);

			request.getRequestDispatcher("/user/wantPutWeb.jsp").forward(request, response);

		} else if (path.equals("/upload.xu")) {
			// �ϴ��ļ�
			String wwNN = request.getParameter("nn");
			String wwName = request.getParameter("wwName");
			String wwAuthor = request.getParameter("wwAuthor");
			String wwPs = request.getParameter("wwPs");
			String wwBz = request.getParameter("wwBz");
			wwRecord ww = new wwRecord();
			ww.putRecord(wwNN, wwName, wwAuthor, wwPs, wwBz);
			Part file = request.getPart("file");
			// �ļ��ϴ��������ļ��ϴ�·��
			String path616 = uploadFile(file, request);

			request.setAttribute("title", "����ɹ�");
			request.setAttribute("msg", "����ɹ�����ȴ���ˣ�·��Ϊ��" + path616);
			request.setAttribute("href", "wantPutWeb.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/readFirst.xu")) {
			// ����˵��
			response.sendRedirect("readFirst.jsp");

		} else if (path.equals("/kzt.xu")) {
			// ��ҳ

			User u = new User();
			request.setAttribute("Users", u.showwUser());

			request.getRequestDispatcher("/guang/guang.jsp").forward(request, response);

		} else if (path.equals("/guang_webdata.xu")) {
			// ��վ�б�
			wwRecord w = new wwRecord();
			request.setAttribute("wwRecord", w.showwRR());
			request.getRequestDispatcher("/guang/guang_webdata.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_yes.xu")) {
			// ͨ������
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_Yes(id);
			if (r == 1) {
				request.setAttribute("title", "��˳ɹ�");
				request.setAttribute("msg", "������˳ɹ���");
			} else {
				request.setAttribute("title", "��˳ɹ�");
				request.setAttribute("msg", "�������ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_no.xu")) {
			// ��������
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_No(id);
			if (r == 1) {
				request.setAttribute("title", "��˳ɹ�");
				request.setAttribute("msg", "���벵�سɹ���");
			} else {
				request.setAttribute("title", "��˳ɹ�");
				request.setAttribute("msg", "���벵��ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_webdata_del.xu")) {
			// ��վɾ������
			String id = request.getParameter("id");
			wwRecord w = new wwRecord();
			int r = w.biu_Del(id);
			if (r == 1) {
				request.setAttribute("title", "�����ɹ�");
				request.setAttribute("msg", "ɾ���ɹ���");
			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "ɾ��ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_webdata.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		} else if (path.equals("/guang_user_del.xu")) {
			// �û�ɾ������
			String id = request.getParameter("id");
			User u = new User();
			int r = u.userDel(id);
			if (r == 1) {
				request.setAttribute("title", "�����ɹ�");
				request.setAttribute("msg", "ɾ���ɹ���");
			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "ɾ��ʧ�ܣ�");
			}
			request.setAttribute("href", "kzt.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/guang_bbs.xu")) {
			// �����б�
			BbsData b = new BbsData();
			request.setAttribute("bbsData", b.showBbs());
			request.getRequestDispatcher("/guang/guang_bbs.jsp").forward(request, response);
		} else if (path.equals("/guang_bbs_del.xu")) {
			// ɾ������
			String id = request.getParameter("id");
			BbsData bb = new BbsData();
			int r = bb.bbsDel(id);
			if (r == 1) {
				request.setAttribute("title", "�����ɹ�");
				request.setAttribute("msg", "ɾ���ɹ���");
			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "ɾ��ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_bbs.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/guang_web.xu")) {
			// ��վ�б�
			WebData w = new WebData();
			request.setAttribute("webData", w.showWeb2());
			request.getRequestDispatcher("/guang/guang_web.jsp").forward(request, response);
		} else if (path.equals("/up616.xu")) {
			// �ϴ�616ҳ��
			request.getRequestDispatcher("/guang/guang_up616.jsp").forward(request, response);
		} else if (path.equals("/guang_upWAR.xu")) {
			// �ϴ�WAR������

			Part filee = request.getPart("file");
			// �ļ��ϴ��������ļ��ϴ�·��
			String path616 = upWAR(filee, request);
			request.setAttribute("title", "okokokk");
			request.setAttribute("msg", "��վ���³ɹ���" + path616);
			request.setAttribute("href", "up616.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		
		
		
		} else if (path.equals("/guang_putDongxi.xu")) {
			// �ϴ������ļ�����

			Part filee2 = request.getPart("file2");
			// �ļ��ϴ��������ļ��ϴ�·��
			String path616 = upOtherFile(filee2, request);
			request.setAttribute("title", "okokokk");
			request.setAttribute("msg", "������~����ȥ�ˣ�" + path616);
			request.setAttribute("href", "up616.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);	
		}
		
		
		else if (path.equals("/add_web.xu")) {
			// �����վ
			String webName = request.getParameter("wName");
			String webAuthor = request.getParameter("wAuthor");
			String webPs = request.getParameter("wPs");
			String webUrl = request.getParameter("wUrl");
			String webIcon = request.getParameter("wIcon");
			if (!webName.equals("") && !webAuthor.equals("")) {
				WebData w = new WebData();
				int r = w.putWebs(webName, webAuthor, webPs, webUrl, webIcon);
				if (r == 1) {
					request.setAttribute("title", "�����ɹ�");
					request.setAttribute("msg", "��ӳɹ���");
				} else {
					request.setAttribute("title", "����ʧ��");
					request.setAttribute("msg", "���ʧ�ܣ�");
				}
				request.setAttribute("href", "guang_web.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "���벻��Ϊ�գ�");
				request.setAttribute("href", "guang_web.xu");
				request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
			}
		} else if (path.equals("/web_del.xu")) {
			// ɾ����վ
			String id = request.getParameter("id");
			WebData w = new WebData();
			int r = w.webDel(id);
			if (r == 1) {
				request.setAttribute("title", "�����ɹ�");
				request.setAttribute("msg", "ɾ���ɹ���");
			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "ɾ��ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_web.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);

		} else if (path.equals("/web_edit.xu")) {
			// ��վ����ҳ��
			String id = request.getParameter("id");
			WebData w = new WebData();
			request.setAttribute("webData", w.getWebByid(id));
			request.getRequestDispatcher("/guang/guang_web_edit.jsp").forward(request, response);

		} else if (path.equals("/editWebs.xu")) {
			// ������վ
			String id = request.getParameter("webId");
			String webName = request.getParameter("webName");
			String webAuthor = request.getParameter("webAuthor");
			String webPs = request.getParameter("webPs");
			String webUrl = request.getParameter("webUrl");
			String webIcon = request.getParameter("webIcon");
			WebData w = new WebData();
			int r = w.editWeb(webName, webAuthor, webPs, webUrl, webIcon, id);
			if (r == 1) {
				request.setAttribute("title", "�����ɹ�");
				request.setAttribute("msg", "�޸ĳɹ���");
			} else {
				request.setAttribute("title", "����ʧ��");
				request.setAttribute("msg", "�޸�ʧ�ܣ�");
			}
			request.setAttribute("href", "guang_web.xu");
			request.getRequestDispatcher("/Includes//result.jsp").forward(request, response);
		}

		/* ���Ĵ����� */
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

	// �û��ϴ������ļ�
	private String uploadFile(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// �õ��ϴ��ļ����ļ���չ��
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// �õ��ϴ��ļ��ı���·��
			String savePath = request.getServletContext().getRealPath("/WEB-INF/wwRecord");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdir();
			}
			// �ļ��ϴ�
			try {
				part.write(savePath + File.separator + fileName);
				path616 = "/WEB-INF/wwRecord/" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "�ϴ�ʧ�ܣ�";
			}
		}
		return path616;

	}
	// �ϴ�WAR��
	private String upWAR(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// �õ��ϴ��ļ����ļ���չ��
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// �õ��ϴ��ļ��ı���·��
           String sysPath = System.getProperty("user.dir"); 
			File f = new File(sysPath+"/webapps");
			if (!f.exists()) {
				f.mkdir();
			}
			// �ļ��ϴ�
			try {
				part.write(sysPath+"/webapps" + File.separator + fileName);
				path616 = "" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "�ϴ�ʧ�ܣ�";
			}
		}
		return path616;

	}
	
	
	// �ϴ������ļ�
	private String upOtherFile(Part part, HttpServletRequest request) {
		String path616 = null;
		String header = part.getHeader("content-disposition");
		String fileName = ExFileName.getFileName(header);
		if (!fileName.equals("")) {
			// �õ��ϴ��ļ����ļ���չ��
			String fileExtName = ExFileName.getFileExtName(header);
			String newFileName = System.currentTimeMillis() + fileExtName;
			// �õ��ϴ��ļ��ı���·��
			String savePath = request.getServletContext().getRealPath("/WEB-INF/others/");
			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdir();
			}
			// �ļ��ϴ�
			try {
				part.write(savePath + File.separator + fileName);
				path616 = "/WEB-INF/others/" + fileName;
			} catch (IOException e) {
				e.printStackTrace();
				path616 = "�ϴ�ʧ�ܣ�";
			}
		}
		return path616;

	}
}