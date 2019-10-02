package com.pro.hellscare.VO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

public class NutritionCSV {
	// 설치위치의 경로명으로 변경해야한다.
	private String filename = "C:\\Dev50\\git3\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\CSV\\nutrition_standard.csv";
	
	public NutritionCSV() {}
	
	public List<NutritionInfo> readCsv() {
		
		List<NutritionInfo> data = new ArrayList<>();
		
		try {
			CSVReader reader = new CSVReader(new FileReader(filename));
			
			ColumnPositionMappingStrategy<NutritionInfo> start 
				= new ColumnPositionMappingStrategy<NutritionInfo>();
			start.setType(NutritionInfo.class);
			
			String[] columns 
				= new String[] {
						"Number", "Separation", "Age", "Calory", 
						"avgCarbohydrate", "recoCarbohydrate", 
						"avgProtein", "recoProtein", 
						"avgFat", "recoFat", "saccharide"
					};
			
			start.setColumnMapping(columns);
			CsvToBean<NutritionInfo> csv = new CsvToBean<NutritionInfo>();
			
			data = csv.parse(start, reader);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		
		return data;
	}
}
