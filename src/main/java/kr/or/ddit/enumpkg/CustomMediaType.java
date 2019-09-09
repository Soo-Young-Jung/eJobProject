package kr.or.ddit.enumpkg;

public enum CustomMediaType {
	JSON("application/json; charset=UTF-8", new CustomJsonMarshallerWithJackson()),
     PLAIN("text/plain; charset=UTF-8", new GenerateContents(){
        public String generate(Object content){
           return content.toString()+"";
        }
     }),
     HTML("text/html; charset=UTF-8", (content)->{
        return "<p>"+content.toString()+"</p>";
     });
     
     private String mime;
     private GenerateContents generator;
     CustomMediaType(String mime, GenerateContents generator){
        this.mime = mime;
        this.generator = generator;
     }
     public String getMime(){
        return this.mime;
     }
     public String generateContent(Object content){
        return generator.generate(content);
     }
     public static CustomMediaType getMediaType(String accept){
        CustomMediaType type = HTML;
        for(CustomMediaType tmp : values()){
           if(accept.toUpperCase().contains(tmp.name())){
              type = tmp;
              break;
           }
        }
        return type;
     }
}
