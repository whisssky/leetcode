package test;

import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

public class Test {

	public static void main(String[] args) {
		String date = "2012-4-34";
		DateLocaleConverter conver = new DateLocaleConverter();
		conver.convert(date);
		System.out.println(date);

	}

}
