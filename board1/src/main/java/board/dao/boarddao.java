package board.dao;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 
import board.dto.boarddto;

@Repository
public class boarddao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<boarddto> boardlist(int startrow,int endrow)
	{
		Map<String,Integer> map=new HashMap<>();
		map.put("startrow",startrow);
		map.put("endrow",endrow);
		return sqlSession.selectList("SQLMapper.boardlist", map);
	}

	public int getTotalA()
	{
		return sqlSession.selectOne("SQLMapper.getTotalA");
	}
	
	public boarddto boardDetail(int seq)
	{
		return sqlSession.selectOne("SQLMapper.boardDetail", seq);
	}
	public int writing(boarddto bdto)
	{
		return sqlSession.insert("SQLMapper.writing", bdto);
	}
	public int updating(boarddto bdto)
	{
		return sqlSession.update("SQLMapper.updating", bdto);
	}
	
	public int deleting(int seq)
	{
		return sqlSession.delete("SQLMapper.deleting",seq);
	}
}
