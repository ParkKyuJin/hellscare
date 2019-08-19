package com.pro.hellscare.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.pro.hellscare.VO.DrugInfoVO;

@Service
public class ParseServiceImpl implements ParseService {
	 // tag값의 정보를 가져오는 메소드
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	@Override
	public void getDrugList(HttpServletRequest req, Model model)  {
		String item_name = req.getParameter("drug_name");
		String entp_name = req.getParameter("entp_name");
		String convertItemName = "";
		String convertEnptName = "";
		
		
		System.out.println(item_name + " , "+ entp_name );
		try {

			convertItemName = URLEncoder.encode(item_name, "utf-8");
			convertEnptName = URLEncoder.encode(entp_name, "utf-8");

			} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

			}

		
		
		if (item_name.length() > 0) {
			item_name = "&item_name=" + convertItemName;
		} 
		if (entp_name.length() > 0) {
			entp_name = "&entp_name=" + convertEnptName;
		}
		
		
		String requestURL = "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList?";
		String serviceKey = "ServiceKey=EnFpF8VUpq%2BpbW1NT5V6RD1P5B7NjOjOEe%2BpErnbAHEPnNrgQkAMg5N35JCKbOpce0%2F5Em%2FGjQwpvz5zfpEEYQ%3D%3D";
	
		
		int page = 1;	// 페이지 초기값
		
		List<DrugInfoVO> list = new ArrayList<DrugInfoVO>();		
		
		
		try{
			while(true){
				
				// parsing할 url 지정(API 키 포함해서)
				String url = requestURL + serviceKey +"&numOfRows=100&pageNo="+page + item_name + entp_name;
				
				System.out.println("requestURL: " + url); // 파싱 요청URL
				
				//***XML문서를 Document라는 객체로 인식.***

		        //1.문서를 읽기위한 공장을 만들어야 한다.
				DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
				//2.Builder를 생성
				DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
				//3.생성된 빌더를 통해서 url로부터 데이터를 가져온다
				Document doc = dBuilder.parse(url);
				
				// root tag 
				doc.getDocumentElement().normalize();
//				System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
				System.out.println("page number : "+page);
				
				
				// 파싱할 tag
				NodeList nList = doc.getElementsByTagName("item");
//				System.out.println("파싱할 리스트 수 : "+ nList.getLength());
				
		
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						
						Element eElement = (Element) nNode;
						
//							System.out.println("######################");
						//System.out.println(eElement.getTextContent());
						
//							System.out.println("약품명  : " + getTagValue("ITEM_NAME", eElement));
//							System.out.println("업체명  : " + getTagValue("ENTP_NAME", eElement));
//							System.out.println("정제 : " + getTagValue("FORM_CODE_NAME", eElement));
//							System.out.println("모양 : " + getTagValue("DRUG_SHAPE", eElement));
//							System.out.println("색상  : " + getTagValue("COLOR_CLASS1", eElement));
						
						DrugInfoVO vo = new DrugInfoVO();
						vo.setItem_seq(getTagValue("ITEM_SEQ", eElement));
						vo.setItem_name(getTagValue("ITEM_NAME", eElement));
						vo.setEntp_name(getTagValue("ENTP_NAME", eElement));
						vo.setForm_code_name(getTagValue("FORM_CODE_NAME", eElement));
						vo.setDrug_shape(getTagValue("DRUG_SHAPE", eElement));
						vo.setColor_class1(getTagValue("COLOR_CLASS1", eElement));
						vo.setLeng_long(getTagValue("LENG_LONG", eElement));
						vo.setLeng_short(getTagValue("LENG_SHORT", eElement));
						vo.setThick(getTagValue("THICK", eElement));
						list.add(vo);
					}	// for end
				}	// if end
				
				page += 1;
				// 페이지당 100줄식이므로 적으면 마지막페이지이므로 종료함 또는 10페이지(총218페이지)만 보여줌
				if(nList.getLength() != 100 || page > 10){	
					break;
				}
			}	// while end
			
		} catch (Exception e){	
			e.printStackTrace();
		}	// try~catch end
		
		model.addAttribute("drugDtos", list);
	}
}
