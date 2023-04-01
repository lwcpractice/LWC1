public class csvprocessor {

    public static List<Account> saveFile(String base64Data) {

		system.debug('input data '+base64Data);
        String data    = (string)JSON.deserializeUntyped(base64Data);
		
			system.debug('deserialized data '+ data);
        list<Account> lstCCToInsert = new list<Account>();


        list<String> lstCSVLines = data.split('\n');

			system.debug('splited data '+lstCSVLines);
        	system.debug('size of slitted data '+ lstCSVLines.size() );
			system.debug(lstCSVLines[1]);
       		system.debug('index of #  '+lstCSVLines[1].indexOf('#'));
        	system.debug('split with comma'+lstCSVLines[1].split(','));
        
        for(Integer i = 1; i < lstCSVLines.size(); i++){


            Account acc = new Account();


            String csvLine = lstCSVLines[i];
            
            system.debug('csvLine '+csvLine);
            system.debug('lentgh of csvLine'+csvLine.length());


            String prevLine = csvLine;
            system.debug('prevLine '+prevLine);
            
            Integer startIndex;
            Integer endIndex;
            
            //handeling to process if double qutoes,comma avaiable
            while(csvLine.indexOf('"') > -1){
            
                if(startIndex == null){
                    startIndex = csvLine.indexOf('"');
                    csvLine = csvLine.substring(0, startIndex) + ':quotes:' + csvLine.substring(startIndex+1, csvLine.length());
                }else{
                    if(endIndex == null){
                        endIndex = csvLine.indexOf('"');
                        csvLine = csvLine.substring(0, endIndex) + ':quotes:' + csvLine.substring(endIndex+1, csvLine.length());
                    }
                }
                
                if(startIndex != null && endIndex != null){
                    String sub = csvLine.substring(startIndex, endIndex);
                    sub = sub.replaceAll(',', ':comma:');
                    csvLine = csvLine.substring(0, startIndex) + sub + csvLine.substring(endIndex, csvLine.length());
                    startIndex = null;
                    endIndex = null;
                }
            }
            
            
            List<String> csvRowData = new List<String>();

			system.debug('csvLine.splitted with comma' + csvLine.split(',')); 
            
            for(String column : csvLine.split(',')){

				system.debug('unprocessed column data '+ column);
                
                column = column.replaceAll(':quotes:', '').replaceAll(':comma:', ',');

				system.debug('processed column data '+ column);
                csvRowData.add(column);


            }


            acc.Name                             = csvRowData[0];
            acc.Site                             = csvRowData[1];
            acc.AccountSource                    = csvRowData[2];


            lstCCToInsert.add(acc);
        }


        
       // insert lstCCToInsert;
        
        
        system.debug('lstCCToInsert' + lstCCToInsert);
        



        return [Select Id, Name, Site, AccountSource From Account Where CreatedDate>=:Date.TODAY()];
    }

}