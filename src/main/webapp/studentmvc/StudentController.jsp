<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="pxu.edu.vn.bai6.Student"
	import="pxu.edu.vn.bai6.StudentModel" import="java.util.Date"
	import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String user = (String)session.getAttribute("user");
	if(user == null){
		request.setAttribute("message", "CHUA DANG NHAP");
		RequestDispatcher dispatcher = request.getRequestDispatcher("../loginmvc/login.jsp");
		if (dispatcher != null) {
			dispatcher.forward(request, response);
		}
	}
	//Lay du lieu tu form
	String hoten = (String) request.getParameter("hoten");
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date ngaysinh = df.parse(request.getParameter("ngaysinh"));
	String gioitinh = (String) request.getParameter("gioitinh");
	String sdt = (String) request.getParameter("sdt");
	//out.println(hoten + "; " + ngaysinh.toString() + "; " + gioitinh + "; " + sdt);
	//Goi StudentModel de luu doi tuong sv vao CSDL
	Student sv = new Student();
	sv.setHoten(hoten);
	sv.setGioitinh(gioitinh);
	sv.setNgaysinh(ngaysinh);
	sv.setSdt(sdt);
	StudentModel myModel = new StudentModel();
	boolean kq = myModel.addStudent(sv);
	if (kq) {
		request.setAttribute("message", "THEM SINH VIEN THANH CONG");
	} else {
		request.setAttribute("message", "THEM SINH VIEN THAT BAI");
	}
	RequestDispatcher dispatcher = request.getRequestDispatcher("StudentView.jsp");
	if (dispatcher != null) {
		dispatcher.forward(request, response);
	}
	%>
</body>
</html>