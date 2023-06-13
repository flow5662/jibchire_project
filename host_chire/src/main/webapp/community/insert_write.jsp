<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="dao.CmtHousewarming"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Post_house" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String imagePath=request.getRealPath("/community/postPics"); 
	int size = 15*1024*1024; 
	try{
		MultipartRequest multi=new MultipartRequest(request,
							imagePath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		CmtHousewarming com = new CmtHousewarming();  //insert할클래스에넣기
		Post_house post = new Post_house(); //값을담을객체생성

		String id = (String) session.getAttribute("ID");
		post.setCust_id(id);
		post.setPost_title(multi.getParameter("post_title"));
		post.setPost_txt(multi.getParameter("post_txt"));
		post.setPost_house(multi.getParameter("post_house"));
		post.setPost_family(multi.getParameter("post_family"));
		post.setPost_direc(multi.getParameter("post_direc"));
		post.setPost_pet(multi.getParameter("post_pet"));
		
		/*복수의 값을 가진 경우는 한꺼번에 넣기*/
		String [] pstl = multi.getParameterValues("post_style");
		String [] pcol = multi.getParameterValues("post_color");
		String colorsum="";
		String stylesum="";
		for(int i=0; i<pcol.length;i++){
			colorsum += pcol[i]+",";
		}
		for(int i=0; i<pstl.length;i++){
			stylesum += pstl[i]+",";
		}
		post.setPost_color(colorsum);
// 		post.setPost_style(stylesum);

		String region1 = multi.getParameter("post_region");
		String region2 = multi.getParameter("post_region2");
		post.setPost_region(region1+region2);
		//지역

		String syear = multi.getParameter("post_startdate_year");
		String smonth = multi.getParameter("post_startdate_month");
		String sdate = multi.getParameter("post_startdate_date");
		String eyear = multi.getParameter("post_enddate_year");
		String emonth = multi.getParameter("post_enddate_month");
		String edate = multi.getParameter("post_enddate_date");
		//날짜값깔끔하게합치려고변수에넣음
		post.setPost_startdate(syear+smonth+sdate);
		post.setPost_enddate(eyear+emonth+edate);


		//변수값합쳐서메소드에보내기
		int rooms = Integer.parseInt(multi.getParameter("post_rooms"));
		int m2 = Integer.parseInt(multi.getParameter("post_m2"));
		int fam = Integer.parseInt(multi.getParameter("post_fam"));
		int houseold = Integer.parseInt(multi.getParameter("post_houseold"));
		int budget = Integer.parseInt(multi.getParameter("post_budget"));
		//int값인변수변환
		post.setPost_rooms(rooms);
		post.setPost_m2(m2);
		post.setPost_fam(fam);
		post.setPost_houseold(houseold);
		post.setPost_budget(budget);
		
		/*파일 저장하기*/
		Enumeration files = multi.getFileNames();
		String sum = null;			
		String thumbnail = "";
		while(files.hasMoreElements()) {
			String filess = (String) files.nextElement();
			String file_name= multi.getFilesystemName(filess);

			/*이미지 파일 저장하기*/
			ParameterBlock pb=new ParameterBlock();
			pb.add(imagePath+"/"+file_name);
			BufferedImage bufferedImage = ImageIO.read(new File(imagePath+"/"+file_name)); 		// jpg->png로 변경하기		// read a jpeg from a inputFile
			ImageIO.write(bufferedImage, "png", new File(imagePath+"/"+file_name));
			
			/*썸네일 파일 속성 정하기 */
			RenderedOp rOp=JAI.create("fileload",pb);  //썸네일로 만들어질 원본이미지 이름(경로포함)
			BufferedImage bi= rOp.getAsBufferedImage(); // 지우면 일반화면은 보이고 썸네일은 보이지 않음
			BufferedImage thumb=new BufferedImage(350,350,BufferedImage.TYPE_INT_RGB);   //BufferedImage(int width, int height, int imageType)
			Graphics2D g=thumb.createGraphics();
			g.drawImage(bi,0,0,350,350,null);   //drawImage : 이미지의 일부분을 크기조절 drawImage(image, sx, sy, sWidth, sHeight)
												//sx : 이미지 왼쪽 상단 모서리가 위치할 Canvas내 X 좌표, sy : 이미지 왼쪽 상단 모서리가 위치할 Canvas내 y 좌
			/*썸네일 이미지를 폴더 안에 저장하기*/
			
			if(filess.equals("post_pics") || filess=="post_pics") {
				File file=new File(imagePath+"/sm_"+file_name);
				ImageIO.write(thumb,"png",file);
				thumbnail = file_name+",";
			}else {
				if(sum==null) {
					sum = file_name+",";
				}else {
					sum += file_name+",";
				}
			}
		}
		// 사진 위 좌표
		String icon1 = multi.getParameter("icon1");
		String icon2 = multi.getParameter("icon2");
		String icon3 = multi.getParameter("icon3");
		String icon4 = multi.getParameter("icon4");
		String icon5 = multi.getParameter("icon5");
		String icon6 = multi.getParameter("icon6");
		String icon7 = multi.getParameter("icon7");
		String icon8 = multi.getParameter("icon8");
		String icon9 = multi.getParameter("icon9");
		String icon10 = multi.getParameter("icon10");
		post.setPost_position(icon1+icon2+icon3+icon4+icon5+icon6+icon7+icon8+icon9+icon10);
		
// 		out.println(post.getPost_position());
		post.setPost_pics(thumbnail+sum);
		// 썸네일로 만든 파일명을 가장 앞칸에 둬서 select을 해오더라도 가장 앞에서 가져올 수 있도록 한다
		com.insert_board(post);
		//게시글 내용을 insert하는 method 호출 
		response.sendRedirect("select_board.jsp?cust_id="+id);
		//로그인 한 상태만 글쓰기가 가능하니까 아이디 바로 보내줄 수 있음
		
	}catch(Exception e){
		e.printStackTrace();
	}
	%>

</body>
</html>