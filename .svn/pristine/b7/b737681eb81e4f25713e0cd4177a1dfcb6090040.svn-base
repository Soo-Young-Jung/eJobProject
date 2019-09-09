package kr.or.ddit.vo;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import kr.or.ddit.common.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of= {"annl_no", "cer_name"})
public class LicenseVO {
	@NotNull(groups=UpdateGroup.class)
	private Integer annl_no;
	@NotBlank
	private String cer_name;
	
	
}
