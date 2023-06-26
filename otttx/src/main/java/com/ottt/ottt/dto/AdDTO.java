package com.ottt.ottt.dto;

import java.util.Objects;

/*광고
 * ad_no		bigint	generated always as identity primary key
	,ad_content	text	not null
 */

public class AdDTO {
	
	private Integer		ad_no;
	private String	ad_content;

	
	
	public AdDTO() {}



	public Integer getAd_no() {
		return ad_no;
	}

	public void setAd_no(Integer ad_no) {
		this.ad_no = ad_no;
	}

	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}



	@Override
	public int hashCode() {
		return Objects.hash(ad_content, ad_no);
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdDTO other = (AdDTO) obj;
		return Objects.equals(ad_content, other.ad_content) && Objects.equals(ad_no, other.ad_no);
	}



	@Override
	public String toString() {
		return "AdDTO [ad_no=" + ad_no + ", ad_content=" + ad_content + "]";
	}

	
	
	
	
	
	
	
	
}
