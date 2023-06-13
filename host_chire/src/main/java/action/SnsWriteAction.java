package action;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.ActionForward;
import dto.Feed;
import svc.SnsWriteService;


public class SnsWriteAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		ActionForward forward=null;
		Feed feed = null;
		int fileSize=20*1024*1024;
		ServletContext context = request.getServletContext();
		String imagePath=context.getRealPath("/sns/feedPics");   	
		
		MultipartRequest multi=new MultipartRequest(request,imagePath,fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy());

		feed = new Feed();
		/*객체의 값 세팅하기. cust_id는 snsWrite.jsp에서 session값을 가져와서 세팅했음*/
		feed.setCust_id(multi.getParameter("cust_id"));
		feed.setFeed_txt(multi.getParameter("feed_txt"));
		feed.setFeed_hashtag(multi.getParameter("feed_hashtag"));
		System.out.println("아이디는 = "+feed.getCust_id());
			
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
				
				if(filess.equals("feed_pics") || filess=="feed_pics") {
					File file=new File(imagePath+"/sm_"+file_name);
					ImageIO.write(thumb,"png",file);
					thumbnail = file_name+",";
				}else {
					if(sum==null) {
						sum = file_name+",";
					}else {
						sum += file_name+",";
						System.out.println("file_name은 =>   "+sum);
					}

				}

				feed.setFeed_pics(thumbnail+sum);
				// 썸네일로 만든 파일명을 가장 앞칸에 둬서 select을 해오더라도 가장 앞에서 가져올 수 있도록 한다
			}
			
		/*service 부르기*/
		SnsWriteService scv = new SnsWriteService();
		boolean isWriteSuccess = scv.registArticle(feed);
		System.out.println("insert 성공했나요? =>"+isWriteSuccess);
		
		if(!isWriteSuccess){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 올리기에 실패했습니다')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("snsListAction.sns");
		}

		return forward; //actionfoward의 객체를 리턴.

	}  	

}