package kr.or.ddit.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;

public class ConnectionFactory {
	private static String driverClassName;
	private static String url;
	private static String username;
	private static String password;
	private static DataSource dataSource;
	static {
		ResourceBundle bundle = ResourceBundle.getBundle("kr.or.ddit.db.dbInfo");
		driverClassName = bundle.getString("driverClassName");
		url = bundle.getString("url");
		username = bundle.getString("username");
		password = bundle.getString("password");
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(driverClassName);
		ds.setUrl(url);
		ds.setUsername(username);
		ds.setPassword(password);
		int initSize = Integer.parseInt(bundle.getString("initSize"));
		long maxWait = Long.parseLong(bundle.getString("maxWait"));
		int maxTotal = Integer.parseInt(bundle.getString("maxTotal"));
		ds.setInitialSize(initSize); // 초기에 만들어 놓을 갯수 
		ds.setMaxWaitMillis(maxWait); // 초기에 만들어 놓은 갯수 보다 많은 요청이 들어오면 요청들이 기다릴 시간
		ds.setMaxTotal(maxTotal); // 반납이 안되면 몇개를 만들 것인지 // 풀링 정책을 결정하는 과정
		dataSource = ds;
	}
	
	public static Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
}
