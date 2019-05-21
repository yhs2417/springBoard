package member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.dto.memberdto;

@Repository
public class memberdao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int signup(memberdto mdto)
	{
		return sqlSession.insert("SQLMapper.signup", mdto);
	}
	
	public String login(memberdto mdto)
	{
		return sqlSession.selectOne("SQLMapper.login", mdto);
	}

	public int withdrawal(String id)
	{
		return sqlSession.delete("SQLMapper.withdrawal", id);
	}
}
