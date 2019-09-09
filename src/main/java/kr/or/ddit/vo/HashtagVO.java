package kr.or.ddit.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of={"hash_name", "bb_no"})
public class HashtagVO implements Serializable {
	private String hash_name;
	private long bb_no;
}
