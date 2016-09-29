package com.fdmy.test;

public class Test {

	public static void main(String[] args) {
		try {
			String aString = "2210	,234 ";
			aString = aString.trim().replaceAll("[,	， ]+", ",");
			String[] productNoArr = aString.split(",");
			for (String no : productNoArr) {
				System.out.println(no);
			}
			System.out.println("=======");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
