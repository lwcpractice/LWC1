public with sharing class JSON2Apex {
   

	public List<String> animals;

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}

    
}