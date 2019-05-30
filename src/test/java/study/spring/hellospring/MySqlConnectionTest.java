package study.spring.hellospring;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MySqlConnectionTest {

	/** DateSource객체를 선언하면 실행시, Spring에 의해서 주입된다. */
	// import javax.sql.DataSource;
	@Autowired
	DataSource ds;

	@Test
	public void testFactory() {
		try {
			/** DB접속하기 */
			// import java.sql.Connection;
			Connection con = ds.getConnection();
			System.out.println(con.toString());
			System.out.println("----DATABASE 접속 성공 ----");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
