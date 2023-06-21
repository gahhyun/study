//DAO
public interface CommunityDao {
	
	//게시글 저장
	int insert(ArticleDTO dto) throws Exception;

}

//DAO Impl
@Repository
public class CommunityDaoImpl implements CommunityDao {
	
	@Autowired
	private SqlSession session;
	private static String namespace = "com.ottt.ottt.dao.CommunityMapper.";

    //게시글 저장
	@Override
	public int insert(ArticleDTO dto) throws Exception {
		return session.insert(namespace + "insert", dto);
        //mapper의 id(insert)로 가져온다
	}

	
}

//SERVICE
public interface CommunityService {

	int insert(ArticleDTO articleDTO) throws Exception;
	
}

//SERVICEImpl
@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	CommunityDao communityDao;
	
	@Override
	public int insert(ArticleDTO articleDTO) throws Exception {
		return communityDao.insert(articleDTO);
	}

}






















