package rconnect;

import java.util.Arrays;

import org.junit.Test;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

public class AnalysisTest {
	
	@Test
	public void genderAnalysis() {
		RConnection rconn = null;

		
		try {
			rconn = new RConnection("127.0.0.1", 6311);
			rconn.eval("library(rJava)");
			rconn.eval("library(DBI)");
			rconn.eval("library(RJDBC)");
			rconn.eval("library(dplyr)");
			
			rconn.eval("drv <- JDBC('oracle.jdbc.OracleDriver', 'C:/jdbc/Oracle/ojdbc8.jar')");
			rconn.eval("rconn <- dbConnect(drv, 'jdbc:oracle:thin:@localhost:1521/XEPDB1','CLASS4', 'CLASS4')");
			rconn.eval("ua <- dbGetQuery(rconn, 'SELECT * FROM userActor')");

			
			rconn.eval("ua_male <- ua %>%" + 
					"filter(UAGENDER == '남자') %>%" + 
					"  group_by(ANO) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))");
			
			RList rList = rconn.eval("ua_male <- as.data.frame(ua_male)").asList();
			String[] ano = rList.at("ANO").asStrings();
			System.out.println(Arrays.toString(ano));
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rconn.eval("dbDisconnect(rconn)");				
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				rconn.close();				
			}
			
		}
	}
}
