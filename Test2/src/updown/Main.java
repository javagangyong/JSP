package updown;

import java.util.Random;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);		// 입력처리 객체
		Random ran = new Random();					// 랜덤
		int cpu, user, count = 0;					// 변수
		
		cpu = ran.nextInt(100) + 1;		// 게임 시작 전 컴퓨터가 값을 정해두기
		
		while(true) {
			System.out.print("숫자 입력 (1 ~ 100) : ");
			user = sc.nextInt();		// 사용자에게 값을 입력받기
			count++;					// 횟수 증가
			if(user == cpu) {			// 값이 일치하면
				break;					// 반복 중단
			}
			else if(user < cpu) {			// 입력값이 작으면
				System.out.println("UP");	// UP
			}
			else if(user > cpu) {			// 입력값이 크면
				System.out.println("DOWN");	// DOWN
			}
		}
		System.out.printf("정답. %d회만에 정답을 맞췄음\n", count);		// 횟수 출력 후
		sc.close();		// 마무리 작업 및 프로그램 종료 (cpu, count 값을 새로 지정하면 다시 실행 가능)
	}

}
