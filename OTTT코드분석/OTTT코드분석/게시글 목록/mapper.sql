<!-- 메인 new 목록(페이징형) -->
    <select id="getArticleList" parameterType="ArticleSearchDTO" resultType="ArticleDTO">
                                //매개변수로 받는 dto
		
		/*com.ottt.ottt.dao.CommunityMapper.getArticleList 호출*/
		SELECT 
			DISTINCT ta.article_no							-- 게시물번호 (DISTINCT : 중복X)
			, tc.article_no as comment_article_no 			-- 댓글 작성한 게시물번호
			, tal.article_no as like_article_no 			-- 좋아요 누른 게시물번호
         	, (SELECT COUNT(*) FROM tb_comment tc2 WHERE tc2.article_no = ta.article_no) as comment_count	-- 댓글 개수
            -- 게시글 번호와 댓글을 작성한 게시글의 번호가 같은 것을 카운트
         	, (SELECT COUNT(*) FROM tb_article_like tal2 WHERE tal2.article_no = ta.article_no) AS like_count -- 좋아요 개수
            -- 게시글 번호와 좋아요 누른 게시글의 번호가 같은 것을 카운트
         	, (SELECT COUNT(*) FROM tb_article_like tal3 WHERE tal3.article_no = ta.article_no AND tal3.user_no = #{user_no} ) AS check_like_count -- 내가 눌렀는지 확인
            -- 게시글 번호와 좋아요누른 게시글의 번호가 같고, 로그인한 회원과 좋아요를 누른 회원이 같을 경우 즉 0또는 1이 나온다
			, tu.user_no							-- 유저번호
			, ta.article_index_no					-- 게시판구분
			, ta.article_content					-- 게시판 내용
			, ta.article_image						-- 사진 경로
			, ta.article_title						-- 게시판 제목
			, ta.article_create_dt					-- 등록일
			, ta.article_mod_dt						-- 수정일
			-- , to_char(ta.article_create_dt,'YYYY-MM-DD') AS article_create_dt	-- 등록일
			-- , to_char(ta.article_mod_dt,'YYYY-MM-DD') AS article_create_dt	-- 수정일
			, tu.user_nicknm				-- 사용자 닉네임
			, tu.image						-- 사용자 프로필사진
			, CASE	
			    WHEN ta.user_no = #{user_no} THEN 'Y'
			    ELSE 'N'
			  END AS writer_chk		-- 로그인한 유저와 댓글 작성자랑 일치하는지 체크

		FROM tb_article tal

		INNER JOIN tb_user tu				-- 사용자 테이블
		ON ta.user_no = tu.user_no 	

		LEFT OUTER JOIN tb_comment tc		-- 댓글 테이블 
		ON ta.article_no = tc.article_no 

		LEFT OUTER JOIN TB_ARTICLE_LIKE tal	-- 좋아요 테이블
		ON ta.article_no = tal.article_no 

		WHERE ta.article_index_no = '1' 	-- 게시판 분류

		<if test="category != null and category == 'myPost'	">				<!-- 내가 쓴 게시글 -->
			/*내가 쓴 게시글*/	
			AND ta.article_no NOTNULL 
			AND ta.user_no = #{user_no}
		</if>
		
		<if test="category != null and category == 'myLike'		">			<!-- 좋아요 누른 게시글 -->
			/*좋아요 누른 게시글*/
			AND tal.article_no NOTNULL 
			AND tal.user_no = #{user_no}
		</if>
		
		<if test="category != null and category == 'myComment'	">		<!-- 댓글 작성 게시글 -->
			/*댓글 작성 게시글*/
			AND tc.article_no NOTNULL 
			AND tc.user_no = #{user_no}
		</if>
		


		<if test="schText != null and schText != '' ">				<!-- 검색어로 조회 -->
			/*게시물내용 검색*/
			AND ta.article_content LIKE CONCAT('%', #{schText}, '%')
		</if>
        
		ORDER BY ta.article_no DESC
        LIMIT 10				-- 10개씩 보이기 고정
        OFFSET #{offset}		-- 구간 조회

    </select>




INNER JOIN tb_user tu				-- 사용자 테이블
-- tb_article tal과 교집합 개념, 회원의 번호와 게시글의 작성 회원번호와 일치 할 경우
ON ta.user_no = tu.user_no 	

LEFT OUTER JOIN tb_comment tc		-- 댓글 테이블 
-- tb_article의 모든것과 tb_comment가 일치 , 게시글의 번호와 댓글을 작성한 게시글의 반호가 일치 할 경우
ON ta.article_no = tc.article_no 

LEFT OUTER JOIN TB_ARTICLE_LIKE tal	-- 좋아요 테이블
-- tb_article의 모든것과 TB_ARTICLE_LIKE가 일치, 게시글의 번호와 좋아요를 누른 게시글의 번호가 일치 할 경우
ON ta.article_no = tal.article_no 




