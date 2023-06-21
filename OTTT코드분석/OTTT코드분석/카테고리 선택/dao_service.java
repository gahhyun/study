//dao
public interface CommunityDao {
	//게시글 전체 목록
	List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception
}
//daoIMpl
@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.CommunityMapper.";

	//게시글 전체 목록 
	@Override
	public List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception {
		return session.selectList(namespace + "getArticleList", dto);
	}
}


//service
public interface CommunityService {	
    //게시글 전체 목록
	List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception;
}

//serviceImpl
@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDao communityDao;

	//게시글 전체 목록
	@Override
	public List<ArticleDTO> getArticleList(ArticleSearchDTO dto) throws Exception {
		return communityDao.getArticleList(dto);
	}
}

