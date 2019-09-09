package kr.or.ddit.vo;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SuggestionVO implements Serializable{
	
	private int sug_no;
	@NotBlank
	private String sug_title;
	@NotBlank
	private String sug_content;
	private int sug_parent;
	private String sug_date;
	private String mem_id;
	private int sug_depth;
	
}
