package ex07;

import java.util.ArrayList;
import java.util.List;

public class FoodService {
	
	private ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
	
	public int add(FoodDTO dto) {
		int row = 0;
		row = row + (list.add(dto) ? 1 : 0);
		return row;
	}
	
	public List<FoodDTO> getList() {
		return list;
	}

}
