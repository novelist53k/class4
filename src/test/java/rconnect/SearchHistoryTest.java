package rconnect;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;

import org.junit.Test;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

public class SearchHistoryTest {
	
	@Test
	public void test() {
		
		RConnection rconn = null;
		
		try {
			rconn = new RConnection();
			
			ArrayList<String> searchHistoryTest = new ArrayList<String>();	// 테스트용 변수
			searchHistoryTest.add("팅커벨 죽이기");
			searchHistoryTest.add("리라장 사건");
			for(int i = 0; i < 5; ++i) {
				searchHistoryTest.add("안녕 인생이란");
			}
			
			for(int i = 0; i < 4; ++i) {
				searchHistoryTest.add("된장 같은 인생이란");
			}
			for(int i = 0; i < 3; ++i) {
				searchHistoryTest.add("팅커벨 같은 인생");
			}
			
			
			
			String r = "c(";	// 검색어를 벡터형으로 rstudio에 전달하기 위한 변수
			for(int i = 0; i < searchHistoryTest.size(); ++i) {
				// 마지막 변수에는 ,를 추가하지 않기 위해 별도 처리
				if(i == searchHistoryTest.size() - 1) {
					r += ("'" + searchHistoryTest.get(i) + "'");
				}
				else {
					r += ("'" + searchHistoryTest.get(i) + "',");					
				}
			}
			r += ")";
			
			rconn.eval("library(KoNLP)");
			rconn.eval("library(stringr)");
			rconn.eval("library(dplyr)");
			rconn.eval("useNIADic()");
			
			rconn.eval("keyword <- " + r);
			rconn.eval("keyword <- str_replace_all(keyword, '\\\\W', ' ')");
			rconn.eval("keyword_list <- extractNoun(keyword)");
			rconn.eval("keyword_vec <- unlist(keyword_list)");
			rconn.eval("keyword <- as.data.frame(keyword_vec, stringsAsFactors = F)");
			rconn.eval("keyword <- rename(keyword, word = keyword_vec)");
			
			rconn.eval("keyword <- keyword %>%" + 
					"  filter(nchar(word) >= 2) %>%" + 
					"  group_by(word) %>%" + 
					"  summarise(feq = n()) %>%" + 
					"  arrange(desc(feq))").asList();
			rconn.eval("keyword <- as.data.frame(keyword)");
			
			RList rList = rconn.eval("keyword").asList();
			String[] word = rList.at("word").asStrings();
			int[] feq = rList.at("feq").asIntegers();
			System.out.println(Arrays.toString(word));	// 많이 사용된 단어 순서대로 내림차순 정렬
			
			
			
			
			
			// ----------------
			
			Random ran = new Random();
			int randomCnt = word.length > 10 ? 10 : word.length;	// 검색어 랜덤 추출에 사용할 단어 개수
			int wordCnt = word.length > 3 ? 3 : word.length;		// 검색에 사용할 단어 개수,
			System.out.println(randomCnt);
			System.out.println(wordCnt);
			int randomIdx[] = new int[wordCnt];	// 검색어 선정에 사용할 랜덤 인덱스 번호
			
			
			for(int i = 0; i < wordCnt; ++i) {
				randomIdx[i] = ran.nextInt(wordCnt);
				for(int j = 0; j < i; ++j) {
					if(randomIdx[i] == randomIdx[j]) {
						--i;
						break;
					}
				}
			}
			System.out.println(Arrays.toString(randomIdx));
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rconn.close();
		}
		
		
	}
}
