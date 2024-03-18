package com.kh.el;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data //전체 메소드 (기본 생성자,getter,setter,string, equals, hashcode)
//@Getter //getter 메소드
//@Setter //setter 메소드
@NoArgsConstructor // 기본 생성자
@AllArgsConstructor // 전체 생성자
@ToString //toString 메소드
@EqualsAndHashCode //equals 와 hashcode 메소드
public class Student {
//	@Getter //원하는 필드만 getter 메소드 만들기
	private String name;
	
	private int age;
	
	private int mathScore;
	
	private int englishScore;
	
	
}
