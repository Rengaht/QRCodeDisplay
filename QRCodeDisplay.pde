float RX=0.2939;
float RY=0.3881;
float RW=0.4116;


float RATIO=1.42;
float OFFSET;
float WID;
String FOLDER_PATH,ORDER_PATH;
int _count=0;
String file_name;
PImage _qr_img;
PImage _back_img;

float twid,theight;

void setup(){
  //println(displayHeight);
 
  size(633,900);
  //fullScreen();
  readParam();
  WID=min(width,height)-OFFSET*2;
  
  checkQRImage();
  _back_img=loadImage("back.png");
  
  theight=height;
  twid=(float)height/RATIO;
}
void draw(){
  
  background(0);
  image(_back_img,0,0,twid,theight);
  
  pushStyle();
    
  if(_count>0){
    
    //imageMode(CENTER);
    if(_qr_img!=null) image(_qr_img,twid*RX,theight*RY,twid*RW,twid*RW);
    
    fill(0);      
    textAlign(CENTER);
    textSize(22);
    text(nf(_count,5),width/2,theight*RY+twid*(RW+.175));
  }else{
      fill(0);
      text("hi",width/2,height/2);
    
  }
  popStyle();
  
  if(frameCount%30==0) checkQRImage();
  
}

void checkQRImage(){
  
  // find latest    
  String fname_=loadStrings(ORDER_PATH)[0];
  //println(fname_+" "+file_name);
  if(!fname_.equals(file_name)){
    
     println("NEW!! "+fname_);
     
     file_name=fname_;
     try{
       _qr_img=loadImage(file_name);
     }catch(Exception e){
        e.printStackTrace(); 
        file_name="";
     }
      
     _count++;
  }
  
}