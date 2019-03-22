 import netP5.*;
import oscP5.*;

OscP5 oscP5;

float cx,cy,px,py;
float cx1,cy1,px1,py1;
float cx2,cy2,px2,py2;
int count1 = 0;
int count2 = 0;
int count = 0;

void setup(){
 
  
  size(500,1000);
  background(255);
  frameRate(25);
  oscP5 = new OscP5(this, 12000);
 
  oscP5.plug(this, "location" , "/1/xy1");
  oscP5.plug(this, "touch1" , "/touch1");
  oscP5.plug(this, "touch2" , "/touch2");

}
public void touch1(float thisx1, float thisy1){
 
  println(thisx1);
  println(thisy1);
  if(count1 ==0){
  cx1 = thisx1*500;
  cy1 = thisy1*1000;
  px1 = cx1;
  py1 = cy1;
  count1+=1;
  }
  else{
    
     
  if(thisx1== -1.0 && thisy1 == -1.0){
     // print("reached");
      cx1 = px1;
      cy1 = py1;
    }
    else{
      cx1 = thisx1*500;
      cy1 = thisy1*1000;
    }
     
    
  
  }
  
}
public void touch2(float thisx2, float thisy2){
  
  if(count2 ==0){
  cx2 = thisx2*500;
  cy2 = thisy2*1000;
  px2 = cx2;
  py2 = cy2;
  count2+=1;
  }
  else{
    
     
  if(thisx2== -1.0 && thisy2 == -1.0){
    //  print("reached");
      cx2 = px2;
      cy2 = py2;
    }
    else{
      cx2 = thisx2*500;
      cy2 = thisy2*1000;
    }
     
    
  
  }
  
}



public void location(float thisx, float thisy){
  
  //println(thisx+" "+thisy);
  //println(testr+" "+testg+" "+testb);
  
  
  if(count ==0){
  cx = thisx*500;
  cy = thisy*1000;
  px = cx;
  py = cy;
  count+=1;
  }
  else{
  
  cx = thisx*500;
  cy = thisy*1000;
  }
  
  }


void draw(){

//  println(testr+" "+testg+" "+testb);
  //stroke(testr,testg,testb);
  stroke(255,0,0);
  strokeWeight(10);
  strokeCap(SQUARE);
  line(cx,cy,px,py);
  line(cx1,cy1,px1,py1);
  line(cx2,cy2,px2,py2);
  
  
    
    px = cx;
    py = cy;
    
    px1 = cx1;
    py1 = cy1;
    
    px2 = cx2;
    py2 = cy2;
  
   
  
  
  
}

void oscEvent(OscMessage themessage){
  
  if(themessage.isPlugged()==false){
  println("### received an osc message.");
  println("### addrpattern\t"+themessage.addrPattern());
  println("### typetag\t"+themessage.typetag());
  }
  
}
