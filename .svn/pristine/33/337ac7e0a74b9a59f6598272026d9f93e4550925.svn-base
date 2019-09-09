package kr.or.ddit.enumpkg;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class CustomJsonMarshallerWithJackson implements GenerateContents {
	@Override
	public String generate(Object content) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(content);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e); // 예외종류 바꿔치기
		}
	}
	
}
