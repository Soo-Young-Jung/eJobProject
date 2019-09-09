package kr.or.ddit.naver;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class naver_restapi {
	public JsonNode getAccessToken(String autorize_code) {

		final String RequestUrl = "https://nid.naver.com/oauth2.0/token";

		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));

		postParams.add(new BasicNameValuePair("client_id", "Yiwd1PDEhyRsA1fS2Cqd"));
		
		postParams.add(new BasicNameValuePair("client_secret", "t3oYuAlT3z"));

		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost/eJobProject/login/naverlogin.do"));

		postParams.add(new BasicNameValuePair("code", autorize_code));

		final HttpClient client = HttpClientBuilder.create().build();

		final HttpPost post = new HttpPost(RequestUrl);

		JsonNode returnNode = null;

		try {

			post.setEntity(new UrlEncodedFormEntity(postParams));

			final HttpResponse response = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();

			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

		}

		return returnNode;

	}

	public static JsonNode getKakaoUserInfo(String autorize_code) {

		final String RequestUrl = "https://openapi.naver.com/v1/nid/me";

		String CLIENT_ID = "Yiwd1PDEhyRsA1fS2Cqd"; // REST API KEY

		String REDIRECT_URI = "http://localhost/eJobProject/login/naverlogin.do"; // 리다이렉트 URI

		String code = autorize_code; // 로그인 과정중 얻은 토큰 값

		final HttpClient client = HttpClientBuilder.create().build();

		final HttpPost post = new HttpPost(RequestUrl);

		// add header

		post.addHeader("Authorization", "Bearer " + autorize_code);

		JsonNode returnNode = null;

		try {

			final HttpResponse response = client.execute(post);

			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);

			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리

			ObjectMapper mapper = new ObjectMapper();

			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();

		} catch (ClientProtocolException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			// clear resources

		}

		return returnNode;

	}

}
