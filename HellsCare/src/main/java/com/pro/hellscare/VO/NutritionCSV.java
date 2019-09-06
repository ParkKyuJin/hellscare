package com.pro.hellscare.VO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

public class NutritionCSV {
	private String filename = "C:\\Users\\wovkf\\git\\hellscare\\hellscare\\HellsCare\\src\\main\\webapp\\resources\\CSV\\nutrition_standard.csv";
	
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
						"avgFat", "recoFat"
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
