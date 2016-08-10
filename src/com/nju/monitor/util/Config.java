package com.nju.monitor.util;

import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

public class Config {

	private static PropertiesConfiguration config = null;
	static {
			try {
				config = new PropertiesConfiguration("config.properties");
			} catch (ConfigurationException e) {
				e.printStackTrace();
			}
	}

	public static String getValue(String key) {
		return config.getString(key,"unknown");
	}
    	
	public static void setValue(String key, Object value) {
		config.setProperty(key, value);
	}
    
	public static void save(){
		try {
			config.save();
		} catch (ConfigurationException e) {
			e.printStackTrace();
		}
	}

}