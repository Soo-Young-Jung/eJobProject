package kr.or.ddit.enumpkg;

import java.lang.reflect.Field;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

public class CustomJsonMarshaller implements GenerateContents {
//	class TestVO{
//		String name = "이름";
//		Integer age = 32;
//	}
//	==>{ "name":"이름", "age":32}
	@Override
	public String generate(Object content) {
		String ptrn = "\"%s\":\"%s\", ";
		StringBuffer result = new StringBuffer("{");
		 if(content instanceof Map){
	           Map map = (Map) content;
	           Set keySet = map.keySet();
	           Iterator it = keySet.iterator();
	           while(it.hasNext()){
	              Object key = it.next();
	              Object value = map.get(key);
	              result.append(String.format(ptrn, key.toString(), value.toString()));
	           }
	        }else{
	        	Class clz = content.getClass();
	        	Field[] flds = clz.getDeclaredFields();
	        	for(Field fld : flds) {
	        		String name = fld.getName();
	        		fld.setAccessible(true);
	        		try {
						Object value = fld.get(content);
						result.append(String.format(ptrn, name, Objects.toString(value, "empty")));
					} catch (IllegalArgumentException | IllegalAccessException e) {
						e.printStackTrace();
					}
	        	}
	        }
		 result.deleteCharAt(result.lastIndexOf(","));
		 result.append("}");
		 return result.toString();   
	}
	
}
