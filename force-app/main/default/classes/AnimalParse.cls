public with sharing class AnimalParse 
{

    public List<String> animals;

	
	public static AnimalParse parse(String json) {
		return (AnimalParse) System.JSON.deserialize(json, AnimalParse.class);
	}
    
}