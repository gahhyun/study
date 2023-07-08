package com.ottt.ottt.controller.mypage;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ottt.ottt.domain.PageResolver;
import com.ottt.ottt.domain.SearchItem;
import com.ottt.ottt.dto.ContentDTO;
import com.ottt.ottt.dto.MyDiaryDTO;
import com.ottt.ottt.dto.UserDTO;
import com.ottt.ottt.service.content.ContentService;
import com.ottt.ottt.service.mypage.MyDiaryService;
import com.ottt.ottt.service.user.UserService;

@Controller
@RequestMapping("/mypage")
public class DiaryController {

	@Autowired
	UserService us;
	
	@Autowired
	ContentService cs;

	@Autowired
	MyDiaryService ds;

	// mydiary 메인
	@GetMapping(value = "/mydiary")
	public String myDiary(String user, SearchItem sc, Model m
							, HttpSession session, HttpServletRequest request) {

		
		// 로그인 했는지 확인하면서 본인 다이어리 눌렀는지 확인 
		if((session.getAttribute("user_nicknm") != null
				&& session.getAttribute("user_nicknm").equals(user))) {
			
			m.addAttribute("userChk", true);
			
			Integer my_no = (Integer) session.getAttribute("user_no");

			try {
				UserDTO userDTO = us.getUser(my_no);

				sc.setPageSize(3);
				sc.setUser(userDTO.getUser_nicknm());
				sc.setUser_no(my_no);
				
				System.out.println("=============mydiary=============== ");
				
				System.out.println("============================ sc.getPage()" + sc.getPage());
				
				System.out.println("============================ sc.getUser()" + sc.getUser());
				
				System.out.println("============================ sc.getUser_no()" + sc.getUser_no());
				
				

				int myDiaryCnt = ds.myDiaryCnt(sc);
				m.addAttribute("myDiaryCnt", myDiaryCnt);

				PageResolver pageResolver = new PageResolver(myDiaryCnt, sc);

				List<MyDiaryDTO> list = ds.getMyDiary(sc);
				m.addAttribute("list", list);
				m.addAttribute("pr", pageResolver);
				m.addAttribute(userDTO);
			
			} catch (Exception e) {
				e.printStackTrace();
			}

			return "/mypage/myprofile/mydiary";			
		}
		
		try {
			Integer user_no = us.getUserNoId(user);
			UserDTO userDTO = us.getUser(user_no);
			
			sc.setPageSize(3);
			sc.setUser(userDTO.getUser_nicknm());
			sc.setUser_no(user_no);
			
			System.out.println("=============남의 다이어리=============== ");
			
			System.out.println("============================ sc.getPage()" + sc.getPage());
			
			System.out.println("============================ sc.getUser()" + sc.getUser());
			
			System.out.println("============================ sc.getUser_no()" + sc.getUser_no());			

			int myDiaryCnt = ds.myDiaryCnt(sc);

			PageResolver pageResolver = new PageResolver(myDiaryCnt, sc);

			List<MyDiaryDTO> listAll = ds.getDiaryList(user_no);
			List<MyDiaryDTO> list = new ArrayList<>();
			
			for(MyDiaryDTO myDiaryDTO : listAll) {
				if(myDiaryDTO.getPublic_yn_cd() == '1') {
					list.add(myDiaryDTO);
				}
			}
			
			int startIndex = (sc.getPage() - 1) * sc.getPageSize();
			int endIndex = Math.min(startIndex + sc.getPageSize(), list.size());
			List<MyDiaryDTO> diaryList = list.subList(startIndex, endIndex);
			
			System.out.println("============================ startIndex : " + startIndex);
			System.out.println("============================ endIndex : " + endIndex);
			
			System.out.println("============================ list.size() : " + list.size());
			
			myDiaryCnt = list.size();
			pageResolver = new PageResolver(myDiaryCnt, sc); 
			
			System.out.println("============================ myDiaryCnt : " + myDiaryCnt);
			System.out.println("============================ pageResolver.getTotalCnt() : " + pageResolver.getTotalCnt());
			
			m.addAttribute("myDiaryCnt", myDiaryCnt);
			m.addAttribute("list", diaryList);
			m.addAttribute("pr", pageResolver);
			m.addAttribute(userDTO);			
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
		return "/mypage/myprofile/mydiary";
	}
	

	@GetMapping("/mydiary/write")
	public String writeDiary(Integer content, HttpSession session, Model m
								, HttpServletRequest request) throws Exception {
		
		if (!loginCheck(request))
			return "redirect:/login";
		
		System.out.println("=============get write=============== ");
		
		System.out.println("=========================== content_no : " + content);
		
		Integer my_no = (Integer) session.getAttribute("user_no");
		String user = URLEncoder.encode((String)session.getAttribute("user_nicknm"), "UTF-8");
		try {
			// 나중에 수정
			if(ds.diaryCnt(content, my_no)==1) {
				
				
				return "redirect:/mypage/mydiary?user="+user;
			}
			
			UserDTO userDTO = us.getUser(my_no);
			ContentDTO contentDTO = cs.getContent(content);
			
			m.addAttribute(contentDTO);
			m.addAttribute(userDTO);
			m.addAttribute("mode", "new");
			
			return "/mypage/myprofile/diary";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/detailPage?content_no" +content;
		}		
	}
	
	
	@PostMapping("/mydiary/write")
	public String write(MyDiaryDTO myDiaryDTO, RedirectAttributes rattr,
			Model m, HttpSession session, HttpServletRequest request ) {
		
		if (!loginCheck(request))
			return "redirect:/login";
		
		System.out.println("=============poset write=============== ");
		
		System.out.println("=========================== myDiaryDTO.getPublic_yn_cd() : " + myDiaryDTO.getPublic_yn_cd());
		
		System.out.println("=========================== myDiaryDTO.getMydiary_content() : " + myDiaryDTO.getMydiary_content());
		
		System.out.println("=========================== myDiaryDTO.getContent_no() : " + myDiaryDTO.getContent_no());
		
		System.out.println("=========================== myDiaryDTO.getUser_no() : " + myDiaryDTO.getUser_no());
		
		System.out.println("=========================== myDiaryDTO.getThumbnail() : " + myDiaryDTO.getThumbnail());

		;
		try {
			if(ds.write(myDiaryDTO) != 1)
				throw new Exception("Write failed");
			
			rattr.addFlashAttribute("msg","WRT_OK");
			String user = URLEncoder.encode(us.getUser(myDiaryDTO.getUser_no()).getUser_nicknm(), "UTF-8");
			return "redirect:/mypage/mydiary?user="+user;
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute(myDiaryDTO);
			m.addAttribute("msg", "WRT_ERR");
			return "/mypage/myprofile/diary";
			
		}
		
	}

	
	// mydiary 클릭 시(작성글 보기)
	@GetMapping("/mydiary/diary")
	public String readDiary(SearchItem sc, Integer content, Model m, HttpSession session
							, RedirectAttributes rattr, HttpServletRequest request) {
		
		Integer my_no = session.getAttribute("user_no") != null ?
							(Integer) session.getAttribute("user_no") : -1;
		
		System.out.println("============================ session.getAttribute(\"user_no\") : " +session.getAttribute("user_no"));
		System.out.println("============================ my_no : " +my_no);
		
		
		sc.setPageSize(3);
		sc.setContent_no(content);
		
		System.out.println("=============get read=============== ");
		
		System.out.println("============================ sc.getPage() : " + sc.getPage());
		
		System.out.println("============================ sc.getUser() : " + sc.getUser());
		
		System.out.println("============================ sc.getContent_no() : " + sc.getContent_no());
		
		System.out.println("============================ sc.getUser_no() : " + sc.getUser_no());
		
		try {
			Integer user_no = us.getUserNoId(sc.getUser());
			UserDTO userDTO = us.getUser(user_no);
			MyDiaryDTO myDiaryDTO = ds.getDiary(sc.getContent_no(),user_no);
			System.out.println("============================ myDiaryDTO : " + myDiaryDTO.toString());
			
			m.addAttribute(myDiaryDTO);
			m.addAttribute(userDTO);
			char pub_stat = myDiaryDTO.getPublic_yn_cd();
			
			System.out.println("============================ pub_stat != '1' : " + (pub_stat != '1'));

			if (!my_no.equals(user_no) && pub_stat != '1')
				rattr.addFlashAttribute("msg", "READ_ERR");

			return "/mypage/myprofile/diary";

		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/mypage/mydiary";
		}
	}
	

	@PostMapping("/mydiary/modify")
	public String modDiary(MyDiaryDTO myDiaryDTO, SearchItem sc, RedirectAttributes rattr
							, Model m, HttpSession session, HttpServletRequest request) {
		
		if (!loginCheck(request))
			return "redirect:/login";
		
		sc.setPageSize(3);
		
		System.out.println("=============modify=============== ");
		
		System.out.println("============================ sc.getPage()" + sc.getPage());
		
		System.out.println("============================ sc.getUser()" + sc.getUser());
		
		System.out.println("============================ sc.getContent_no()" + sc.getContent_no());
		
		System.out.println("============================ sc.getUser_no()" + sc.getUser_no());

		Integer user_no = (Integer) session.getAttribute("user_no");
		myDiaryDTO.setUser_no(user_no);

		try {

			if (ds.modDiary(myDiaryDTO) != 1)
				throw new Exception("Modify failed");

			rattr.addFlashAttribute("msg", "MOD_OK");

			String encodedUser = URLEncoder.encode(sc.getUser(), StandardCharsets.UTF_8);
			String queryString = "user=" + encodedUser + "&content=" + sc.getContent_no()+"&page=" +sc.getPage();
	        return "redirect:/mypage/mydiary/diary?" + queryString;
			
			
			//return "redirect:/mypage/mydiary/diary";
			//return "forward:/mypage/mydiary/diary"+sc.getString();

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("myDiaryDTO", myDiaryDTO);
			m.addAttribute("page", sc.getPage());
			m.addAttribute("pageSize", sc.getPageSize());
			m.addAttribute("user", sc.getUser());
			m.addAttribute("msg", "MOD_ERR");
			return "/mypage/myprofile/mydiary";
		}

	}
	
	@PostMapping("/mydiary/remove")
	public String rmvDiary (MyDiaryDTO myDiaryDTO, SearchItem sc, HttpServletRequest request
			, RedirectAttributes rattr, Model m, HttpSession session) throws Exception {
		
		if (!loginCheck(request))
			return "redirect:/login";
		
		Integer user_no = (Integer) session.getAttribute("user_no");
		System.out.println("====================================== remove 진입 ");
		System.out.println("====================================== myDiaryDTO.toString() : " + myDiaryDTO.toString());
		System.out.println("====================================== user_no " + user_no);
		System.out.println("====================================== myDiaryDTO.getUser_no() " + myDiaryDTO.getUser_no());
		
		if(user_no.equals(myDiaryDTO.getUser_no()) ) {
			System.out.println("====================================== if 진입 ");
			try {
				if(ds.remove(myDiaryDTO.getContent_no(), user_no) != 1)
					throw new Exception("Delete failed");	
				
			} catch (Exception e) {
				e.printStackTrace();
				rattr.addFlashAttribute("msg", "DEL_ERR");
				return "forward:/mypage/mydiary/diary"+sc.getString();
			}
			
			rattr.addAttribute("page", sc.getPage());
			rattr.addAttribute("pageSize", sc.getPageSize());
			rattr.addFlashAttribute("msg", "DEL_OK");
		}
		
		String user = URLEncoder.encode((String)session.getAttribute("user_nicknm"), "UTF-8");
		
		return "redirect:/mypage/mydiary?user="+user;
	}
	
	
	@GetMapping("/diary")
	public String userDiary () {
		
		return "";
	}


	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어 (false는 session이 없어도 새로 생성하지 않음, 반환값은 null)
		HttpSession session = request.getSession(false);
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환
		return session != null && session.getAttribute("id") != null;
	}
}
