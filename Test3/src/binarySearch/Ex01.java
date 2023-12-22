package binarySearch;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Ex01 {
	public static void main(String[] args) {
		
		Integer[] arr = new Integer[10];
		for(int i = 0; i < arr.length; i++) {
			arr[i] = i;
		}
		
		// 위 배열에서 정수 n을 탐색할때 n은 몇번째에 있을까?
		System.out.println(Arrays.toString(arr));
		List<Integer> list = Arrays.asList(arr);
		
		Collections.shuffle(list);
		System.out.println(list);
	}

}
