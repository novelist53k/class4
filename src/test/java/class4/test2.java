package class4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.junit.Test;

import com.class4.command.ActorVO;
import com.class4.command.DirectorVO;
import com.class4.command.mapping.MovieActorVO;
import com.class4.command.mapping.MovieDirectorVO;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;

public class test2 {
	
	@Test
	public void actorTest() {
		// api에 사용할 객체 service
		KobisOpenAPIRestService service = new KobisOpenAPIRestService("7e7efe4ec48bc16bff2f86fbc588f9ca");
		String itemPerPage = "100";	// 가져올 사람 수
		int row = Integer.parseInt(itemPerPage);
		
		try {
			// 문자열을 반환 후 json 형식을 HashMap으로 변경하여 영화인리스트에서 영화인코드로 접근
			String strPeopleList = service.getPeopleList(true, "100", itemPerPage, "", "");
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> peopleHashMap = mapper.readValue(strPeopleList, HashMap.class);
			HashMap<String, Object> peopleListResult = (HashMap<String, Object>)peopleHashMap.get("peopleListResult");
			
			// peopleCd를 리스트에 보관
			ArrayList<String> peopleCdList = new ArrayList<String>();
			for(int i = 0; i < row; ++i) {
				// peopleCd를 리스트에 추가
				HashMap<String, Object> peopleList = (HashMap<String, Object>) ((ArrayList<Object>) peopleListResult.get("peopleList")).get(i);
				peopleCdList.add(peopleList.get("peopleCd").toString());

			}
			
			for(int i = 0; i < peopleCdList.size(); ++i) {
				
				// peopleCd로 영화인 정보 추출
				String strActorInfo = service.getPeopleInfo(true, peopleCdList.get(i));
				HashMap<String, Object> peopleResult = mapper.readValue(strActorInfo, HashMap.class);
				LinkedHashMap<String, Object> peopleInfoResult = (LinkedHashMap<String, Object>) peopleResult.get("peopleInfoResult");
				LinkedHashMap<String, Object> peopleInfo = (LinkedHashMap<String, Object>) peopleInfoResult.get("peopleInfo");
				System.out.println(peopleInfo);
				
				// 인물코드, 이름
				String peopleCd = peopleInfo.get("peopleCd").toString();
				String peopleNm = peopleInfo.get("peopleNm").toString();
				
				// 배우면 ActorVO에, 감독이면 DirectorVO에 추가
				if(peopleInfo.get("repRoleNm").equals("배우")) {
					// Actor 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
					
					ActorVO actorVO = new ActorVO(peopleCd, peopleNm);
					System.out.println("배우 : " + actorVO.toString());
				}
				else if(peopleInfo.get("repRoleNm").equals("감독")) {
					// Director 테이블을 조회해서 이미 있는 peopleCd라면 추가하지 말고 출연, 감독한 영화로 이동
					
					DirectorVO directorVO = new DirectorVO(peopleCd, peopleNm);
					System.out.println("감독 : " + directorVO.toString());
				}
				else {
					System.out.println("배우도 감독도 아니라고라?");
				}
				
				
				// 출연, 감독한 정보 추출
				ArrayList<Object> filmos = (ArrayList<Object>) peopleInfo.get("filmos");
				
				// 출연, 감독한 영화의 키 저장
				ArrayList<String> filmosMovieCdList = new ArrayList<String>();
				
				for(int j = 0; j < filmos.size(); ++j) {
					LinkedHashMap<String, Object> filmoInfo = (LinkedHashMap<String, Object>) filmos.get(j);
					
					if(filmoInfo.get("moviePartNm").equals("배우")) {
						// MovieActor 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
						
						MovieActorVO movieActorVO = new MovieActorVO(1, filmoInfo.get("movieCd").toString(), peopleCd);
						System.out.println("출연 영화 : " + movieActorVO.toString());
					}
					else if (filmoInfo.get("moviePartNm").equals("감독")) {
						// MovieDirector 테이블을 조회해서 movieCd와 peopleCd가 모두 일치하면 추가X
						
						MovieDirectorVO movieDirectorVO = new MovieDirectorVO(1, filmoInfo.get("movieCd").toString(), peopleCd);
						System.out.println("감독한 영화 : " + movieDirectorVO.toString());
					}
				}
				
				
			}
			
			System.out.println(peopleCdList);
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
}
