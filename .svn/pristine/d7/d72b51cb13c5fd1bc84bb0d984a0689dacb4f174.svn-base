package kr.or.ddit.license.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;

@RestController
public class LicenseController {
	
	@Value("#{appInfo.license}")
	private File filePath;
	
	@Inject
	WebApplicationContext container;
	
	@RequestMapping(value="/license/license.do",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<Map<String, Object>> process(@RequestParam(required=true) String inputnm){
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse(new FileReader(filePath));
		} catch (IOException | ParseException e) {
			throw new RuntimeException(e);
		}
		JSONObject jsonObject = (JSONObject) obj;
		
		String searchward = inputnm.trim();
		
		JSONArray array = (JSONArray) jsonObject.get("records");
		for(int i=0; i<array.size(); i++){
			
			JSONObject search = (JSONObject) array.get(i);
			Map<String, Object> temp = new HashMap<>();
			
			String jmfldnm = (String) search.get("jmfldnm");
			
			if(jmfldnm.trim().contains(searchward)) {
				System.out.print("result :: " + jmfldnm + " " + search.get("jmcd") + "\n");
				temp.put("jmfldnm", jmfldnm);
				temp.put("jmcd", search.get("jmcd"));
				result.add(temp);
			}
			
		}
		return result;
	}
	
}
