package board.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.dto.memberdto;
import member.dao.memberdao;
import board.dao.boarddao;
import board.dto.boarddto;

@Controller
public class controller 
{
	@Autowired
	private memberdao memberdao;
	@Autowired
	private boarddao boarddao;
	
	ModelAndView mav;
	
	@RequestMapping(value="/member/signup.do")
	public ModelAndView signup(HttpServletRequest request)
	{
		System.out.println("--------회원가입진입성공------");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String email=request.getParameter("email");
		
		memberdto mdto=new memberdto();
		mdto.setId(id);
		mdto.setPwd(pwd);
		mdto.setEmail(email);
		
		mav=new ModelAndView();
		try
		{
			memberdao.signup(mdto);
			mav.addObject("msg","회원가입 되셨습니다");
			System.out.println("----회원가입성공----------");
		}
		catch(Exception e)
		{
			mav.addObject("msg","이미 가입되어있는 아이디이거나 기타 오류입니다");
			System.out.println("----회원가입실패---------");
			e.printStackTrace();
		}
		finally
		{
		mav.setViewName("../index.jsp");
		}
		return mav;
	}
	
	@RequestMapping(value="/member/login.do")
	public ModelAndView login(HttpServletRequest request)
	{
		System.out.println("--------로그인진입성공------");
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		 
		memberdto mdto=new memberdto();
		mdto.setId(id);
		mdto.setPwd(pwd);
		
		id=memberdao.login(mdto);
		
		//로그인성공한 아이디로 세션 만들어야됨에 주의.
		HttpSession session=request.getSession();
		session.setAttribute("session_id",id);
		
		System.out.println("--------로그인쿼리성공------"+id);
		
		mav=new ModelAndView();
		if(id==null)
		{
			mav.addObject("msg","일치하는 회원정보가 없습니다.");
			System.out.println("--------로그인에러상황------");	 
		}
		
		mav.setViewName("../index.jsp"); //target_top으로+ redirect로는 자료 넘어가지 않음
		return mav; 
	}
	
	@RequestMapping(value="/board/logout.do")
	public ModelAndView logout(HttpServletRequest request)
	{	
		HttpSession session=request.getSession();
		session.invalidate();
		
		System.out.println("--------로그아웃세션삭제------");
		mav=new ModelAndView();
		mav.setViewName("redirect:../index.jsp");
		return mav;
	}
	
	@RequestMapping(value="/board/withdrawal.do")
	public ModelAndView withdrawal(HttpServletRequest request)
	{
		System.out.println("--------회원탈퇴진입------");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("session_id");
		
		session.invalidate();
		
		memberdao.withdrawal(id);
		System.out.println("--------회원삭제와 로그아웃성공------");
		
		mav=new ModelAndView();
		mav.addObject("msg","회원탈퇴 처리 되셨습니다.");
		mav.setViewName("../index.jsp");
		return mav;
		
	}
	
	@RequestMapping(value="/board/boardlist.do")
	public ModelAndView board_list(HttpServletRequest request)
	{
		 
		int page=Integer.parseInt(request.getParameter("page"));
		//한페이지당 7개글로
		int endrow=page*7;
		int startrow=endrow-6;
		
		List<boarddto> res=new ArrayList<boarddto>();
		res=boarddao.boardlist(startrow,endrow);
		 
		System.out.println("--------전체게시판 쿼리 성공------");
		
		
		//5개 페이지씩
		int startpg=((page-1)/5)*5+1;
		int endpg=startpg+4;
		int totalA=boarddao.getTotalA();
		int totalP=(totalA+6)/7;
		
		if(endpg>totalP) endpg=totalP;
		
		mav=new ModelAndView();
		mav.addObject("boardlist",res);
		mav.addObject("startpg",startpg);
		mav.addObject("endpg",endpg);
		mav.addObject("totalP",totalP);
		mav.addObject("page",page);
		
		mav.setViewName("boardList.jsp");
		System.out.println("--------전체게시판 조회 성공------" );
		return mav; 
	}
	
	@RequestMapping(value="/board/boardDetail.do")
	public ModelAndView boardDetail(HttpServletRequest request)
	{
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		boarddto bdto=new boarddto();
		bdto=boarddao.boardDetail(seq);
		
		mav=new ModelAndView();
		mav.addObject("bdto",bdto);
		mav.setViewName("boardDetail.jsp");
		System.out.println("------글 자세히 보기 성공------" );
		return mav;
	}
	
	@RequestMapping(value="/board/writing.do")
	public ModelAndView writing(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("session_id");
		
		String header=request.getParameter("header");
		String content=request.getParameter("content");
		content=content.replace("\r\n","<br>");
		
		boarddto bdto=new boarddto();
		bdto.setHeader(header);
		bdto.setContent(content);
		bdto.setAuthor(id);
		
		mav=new ModelAndView();
		try
		{
			boarddao.writing(bdto);
			mav.addObject("msg","글이 작성되었습니다.");
			System.out.println("----글 작성성공----------");
		}
		catch(Exception e)
		{
			mav.addObject("msg","글 작성에 실패하였습니다");
			System.out.println("----글 작성실패---------");
			e.printStackTrace();
		}
		finally
		{
		mav.setViewName("../index.jsp");
		}
		return mav; 	
	}
	

	@RequestMapping(value="/board/rewrite.do")
	public ModelAndView rewrite(HttpServletRequest request)
	{
		int seq=Integer.parseInt(request.getParameter("seq"));
		
		boarddto bdto=new boarddto();
		bdto=boarddao.boardDetail(seq);
		
		mav=new ModelAndView();
		mav.addObject("bdto",bdto);
		mav.setViewName("rewrite.jsp");
		System.out.println("------rewrite.do->rewriting.jsp 성공------"+bdto.getHeader());
		return mav;
	}
	
	@RequestMapping(value="/board/updating.do")
	public ModelAndView updating(HttpServletRequest request)
	{
		int seq=Integer.parseInt(request.getParameter("seq"));
		String header=request.getParameter("header");
		String content=request.getParameter("content");
		content=content.replace("\r\n","<br>");
		
		boarddto bdto=new boarddto();
		bdto.setSeq(seq);
		bdto.setHeader(header);
		bdto.setContent(content);
		
		mav=new ModelAndView();
		try
		{
			boarddao.updating(bdto);
			mav.addObject("msg","글을 수정하였습니다.");
		}
		catch(Exception e)
		{
			mav.addObject("msg","글을 수정하지 못하였습니다");
			System.out.println("글 업데이트 완료");
			e.printStackTrace();
		}
		finally
		{
			mav.setViewName("../index.jsp");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/board/deleting.do")
	public ModelAndView deleting(HttpServletRequest request)
	{
		System.out.println("--------게시글 삭제 진입------" );
		int seq=Integer.parseInt(request.getParameter("seq"));
	
		mav=new ModelAndView();
		try
		{
			boarddao.deleting(seq);
			mav.addObject("msg","글이 삭제되었습니다.");
			System.out.println("----글 삭제성공----------");
		}
		catch(Exception e)
		{
			mav.addObject("msg","글 삭제에 실패했습니다");
			System.out.println("----글 삭제실패---------");
			e.printStackTrace();
		}
		finally
		{
		mav.setViewName("../index.jsp");
		}
		return mav; 
	}
}
