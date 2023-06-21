	<!-- 게시글 저장 -->
	<insert id="insert" parameterType="ArticleDTO">
	<!-- id를 가지고 계속 움직인다. -->
		/*com.ottt.ottt.dao.CommunityMapper.insert 호출*/

		INSERT INTO tb_article (
			article_content 		//내용
			, article_image 		//이미지
			, article_image_name 	//파일명
			, user_no 				//게시글 작성자 번호
			, article_create_dt 	//작성일
			, article_index_no 		//게시판 구분 번호
		)
		VALUES(
			#{article_content}
			, #{article_image}
			, #{article_image_name}
			, #{user_no}
			, now()
			,'1'
		)
	</insert>



