package com.ottt.ottt.dto;

import java.util.Objects;

/*게시판 종류
 *article_index_no	char(1)	primary key
	,article_index_nm	varchar(10)	not null
 */

public class ArticleIndexDTO {
	
	private Character article_index_no;
	private String article_index_nm;
	
	
	
	public ArticleIndexDTO() {}




	public Character getArticle_index_no() {
		return article_index_no;
	}




	public void setArticle_index_no(Character article_index_no) {
		this.article_index_no = article_index_no;
	}


	public String getArticle_index_nm() {
		return article_index_nm;
	}




	public void setArticle_index_nm(String article_index_nm) {
		this.article_index_nm = article_index_nm;
	}




	@Override
	public int hashCode() {
		return Objects.hash(article_index_nm, article_index_no);
	}




	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ArticleIndexDTO other = (ArticleIndexDTO) obj;
		return Objects.equals(article_index_nm, other.article_index_nm)
				&& Objects.equals(article_index_no, other.article_index_no);
	}




	@Override
	public String toString() {
		return "ArticleIndexDTO [article_index_no=" + article_index_no + ", article_index_nm=" + article_index_nm + "]";
	}



	
	
	

	


}
