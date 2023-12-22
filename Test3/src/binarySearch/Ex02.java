package binarySearch;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

public class Ex02 {
	public static void main(String[] args) {
		
		Integer[] arr = new Integer[100];
		Random ran = new Random();
		for(int i = 0; i < arr.length; i++) {
			arr[i] = ran.nextInt(100);	// 랜덤정수의 범위는 0 ~ 99
		}
		
		List<Integer> list = Arrays.asList(arr);
		System.out.println(list);
		
		list.sort(null);
		
		System.out.println(list);
		
		int start = 0;
		int end = 99;
		int mid = (start + end) / 2;
		int find = 51;
		
		while(start <= end) {
			mid = (start + end) / 2;	// 위치정보, 인덱스
			int test = list.get(mid);	// 중간에 있는 값을 찾는다
			
			System.out.printf("%d ~ %d : %d [%d]\n", start, end, mid, test);
			
			if(find == test) {
				break;
			}
			else if(find < test) {
				end = mid - 1;
			}
			else if(find > test) {
				start = mid + 1;
			}
		}
		
	}

}
