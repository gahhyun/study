<!-- 메인 new 목록(페이징형) -->
    <select id="getArticleList" parameterType="ArticleSearchDTO" resultType="ArticleDTO">
		
		/*com.ottt.ottt.dao.CommunityMapper.getArticleList 호출*/
		SELECT 
			DISTINCT ta.article_no							-- 게시물번호
			, tc.article_no as comment_article_no 			-- 코맨드 작성한 게시물번호
			, tal.article_no as like_article_no 			-- 좋아요 누른 게시물번호
         	, (SELECT COUNT(*) FROM tb_comment tc2 WHERE tc2.article_no = ta.article_no) as comment_count	-- 코멘트 개수
         	, (SELECT COUNT(*) FROM tb_article_like tal2 WHERE tal2.article_no = ta.article_no) AS like_count -- 좋아요 개수
         	, (SELECT COUNT(*) FROM tb_article_like tal3 WHERE tal3.article_no = ta.article_no AND tal3.user_no = #{user_no} ) AS check_like_count -- 내가 눌렀는지 확인
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
		FROM tb_article ta
		INNER JOIN tb_user tu				-- 사용자 테이블
		ON ta.user_no = tu.user_no 	
		LEFT OUTER JOIN tb_comment tc		-- 댓글 테이블 
		ON ta.article_no = tc.article_no 
		LEFT OUTER JOIN TB_ARTICLE_LIKE tal	-- 좋아요 테이블
		ON ta.article_no = tal.article_no 
		WHERE ta.article_index_no = '1' 	-- 게시판 분류

		<if test="category != null and category == 'myPost'	">				<!-- 내가 쓴 게시글 -->
			/*내가 쓴 게시글*/
			-- article_no이 존재 해야하며, 게시글 작성자와 로그인한 회원이 동일한 경우
			AND ta.article_no NOTNULL 
			AND ta.user_no = #{user_no}
		</if>
		
		<if test="category != null and category == 'myLike'		">			<!-- 좋아요 누른 게시글 -->
			/*좋아요 누른 게시글*/
			-- article_no이 존재 해야하며, 게시글 작성자와 로그인한 회원이 동일한 경우
			AND tal.article_no NOTNULL 
			AND tal.user_no = #{user_no}
		</if>
		
		<if test="category != null and category == 'myComment'	">		<!-- 댓글 작성 게시글 -->
			/*댓글 작성 게시글*/
			-- article_no이 존재 해야하며, 게시글 작성자와 로그인한 회원이 동일한 경우
			AND tc.article_no NOTNULL 
			AND tc.user_no = #{user_no}
		</if>
		


		<if test="schText != null and schText != '' ">				<!-- 검색어로 조회 -->
			/*게시물내용 검색*/
			AND ta.article_content LIKE CONCAT('%', #{schText}, '%')
			-- CONCAT 함수는 문자열을 연결하는 함수
			-- %는 LIKE 연산자와 함께 사용되어 해당 패턴을 포함하는 문자열을 찾습니다.
			-- #{schText} 변수의 값이 포함된 문자열을 검색
		</if>

		ORDER BY ta.article_no DESC
        LIMIT 10				-- 10개씩 보이기 고정
        OFFSET #{offset}		-- 구간 조회
		--예를 들어, OFFSET 20은 결과 집합에서 21번째부터 데이터를 가져오라는 의미입니다.
		--OFFSET #{offset}을 사용하여 SQL에서 특정 위치부터 데이터를 가져올 수 있습니다. 
		-- #{offset} 값에는 가져올 데이터의 시작 위치를 지정해야 합니다.

    </select>
