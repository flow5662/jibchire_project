package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


import dto.ActionForward;


public class PublicApiRepairStore implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception, IOException, ParseException {
		
		ActionForward forward= new ActionForward();
		
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		urlBuilder.append("/" +  URLEncoder.encode("686a544b446a656f34386372424b73","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
		urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
		urlBuilder.append("/" + URLEncoder.encode("eduCmpltEnt","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
		urlBuilder.append("/" + URLEncoder.encode("487","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
		
		// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
		//urlBuilder.append("/" + URLEncoder.encode("20220301","UTF-8")); /* 서비스별 추가 요청인자들*/
		
		URL url = new URL(urlBuilder.toString());
		System.out.println("url = "+urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
		BufferedReader rd;

		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
				sb.append(line);
		}
		rd.close();
		conn.disconnect();
//		System.out.println(sb.toString());
		
		/*JSON으로 가져온 데이터 추출하기*/
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString()); //1. JSON데이터를 넣어 JSON Object 로 만들어 준다		
		//System.out.println("jsonObject 잘 들어갔니==> "+jsonObject);
		
		JSONObject jobject = (JSONObject)jsonObject.get("eduCmpltEnt"); // 2. VwRepairToolRent 안에 row라는 key값에 정보가 존재하기 때문에 큰 틀에서 한번 더 객체화해준다 
		JSONArray array = (JSONArray)jobject.get("row"); // 3. 배열 추출
		System.out.println("배열크기 487=> "+array.size());
		
		request.setAttribute("array", array);

		forward.setPath("../sns/view_repairstore.jsp");
		return forward;
	}
}
//			스프링 사용하면 이 라이브러리 이용해야
//			<!-- https://mvnrepository.com/artifact/com.googlecode.json-simple/json-simple -->
//			<dependency>
//			    <groupId>com.googlecode.json-simple</groupId>
//			    <artifactId>json-simple</artifactId>
//			    <version>1.1.1</version>
//			</dependency>

