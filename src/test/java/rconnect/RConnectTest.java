package rconnect;

 

import java.util.Arrays;

 

import org.junit.Test;

import org.rosuda.REngine.Rserve.RConnection;

 

public class RConnectTest {

	

	@Test

	public void test() { 

		/*

		 * 1. pom.xml에 연결을 위한 라이브러리 Rserve, Rengine을 추가

		 * 2. Rstudio에서 Rsever를 설치 -> 아래 명령어로 포트번호, 인코딩형식, 기본설정을 세팅

		 * 	install.packages('Rserve')

			library(Rserve)

			Rserve(FALSE, port = 6311, args = '--RS-encoding utf8 --no-save --slave --encoding utf8 --internet2')

			Rserve(args = "--RS- encoding utf8")

		 */

		

		RConnection conn = null;

		

		// 1. RConnect 로드

		try {

			conn = new RConnection("127.0.0.1", 6311);

			System.out.println(conn);

			

			// eval() 함수는 r코드를 실행

			// as타입() 함수는 r코드의 실행 결과를 받아옵니다

			

			// 더블형

			double r1 = conn.eval("mean(c(10,20,30,40))").asDouble();

			System.out.println(r1);

			

			// 정수형

			int r2 = conn.eval("mean(c(100, 80, 30, 20))").asInteger();

			System.out.println(r2);

			

			// 문자열

			String r3 = conn.eval("paste('hello', 'world')").asString();

			System.out.println(r3);

			

			// vector형 문자열 -> String 배열

			String[] r4 = conn.eval("c('hi', 'bye', '빠이')").asStrings();

			System.out.println(Arrays.toString(r4));

			

			// java에서 매개변수를 넘기고, 동적으로 이미지파일 생성

			// 주의할 점 r에서 줄바꿈으로 처리하는 문법은, 자바에서 하나의 구문으로 처리하던, 문자열을 +로 연결한 형식으로 표현한다

			String filename = "자바에서 생성한 PNG";

			

			conn.eval("setwd('C:\\\\Users\\\\USER\\\\Desktop\\\\course\\\\spring\\\\upload')");

			conn.eval("library(ggplot2)");

			conn.eval("mpg <- as.data.frame(mpg)");

			conn.eval("print(png(width = 500, height = 500, filename = '" + filename + ".png'))");

			conn.eval("print(ggplot(mpg, aes(x = class, fill = class)) + geom_bar())");

			conn.eval("print(graphics.off())");

			

			// 파이프라인과 출력

			conn.eval("library(ggplot2)");

			conn.eval("library(dplyr)");

			conn.eval("d1 <- as.data.frame(mpg) %>%" + 

					"  group_by(manufacturer) %>%" + 

					"  summarise(mean_hwy = mean(hwy))");

			conn.eval("print(png(width = 500, height = 500, filename = 'd1.png'))");

			conn.eval("print(ggplot(d1, aes(x = manufacturer, y = mean_hwy, fill = manufacturer)) +" + 

					"  geom_col() +" + 

					"  coord_flip())");

			conn.eval("print(graphics.off())");

			

			

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

	}

	

	

	

}