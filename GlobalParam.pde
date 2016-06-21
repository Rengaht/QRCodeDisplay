void readParam(){
  
   XML pxml=loadXML("param_file.xml");
   XML param_xml;
  try{
    param_xml=loadXML("data\\param_file.xml");
  }catch(Exception e){
    println("No Param!!");   
    return;
  }
  
  FOLDER_PATH=(param_xml.getChildren("QRCODE_FOLDER")[0]).getContent();
  ORDER_PATH=FOLDER_PATH+"\\"+(param_xml.getChildren("QRCODE_ORDER_FILE")[0]).getContent();
  
  OFFSET=float((param_xml.getChildren("QRCODE_OFFSET")[0]).getContent());
  println("OFFSET= "+OFFSET);
  println("Checking Folder: "+FOLDER_PATH+" ....");
}