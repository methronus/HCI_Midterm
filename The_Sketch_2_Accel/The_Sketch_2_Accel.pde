import netP5.*;
import oscP5.*;

OscP5 oscP5;

int count = 0;
float cx, cy, px, py;
float testr, testb, testg;
float g_x, g_y, g_z;
float a_x, a_y, a_z;
float l_x, l_y, l_z;
float gx, gy, gz;
FloatList x_coord;
FloatList y_coord;
FloatList storex = new FloatList();
FloatList storey = new FloatList();
float avgx;
FloatList avgxer = new FloatList();
float ix = 500.0;
float iy = 500.0;
float anglex, angley;
float cos_v;
void setup(){
 
  
  size(1000,1000);
  background(255);
  frameRate(40);
  delay(500);
  oscP5 = new OscP5(this, 12000);
 
  oscP5.plug(this, "gyroscope", "/gyroscope");
 
  oscP5.plug(this, "linear_accel", "/linearacceleration");
  
  oscP5.plug(this, "rotation", "/rotationvector");
 
  
}

public void rotation(float thisx, float thisy, float thisz, float thiscos, float thisb){
  
 cos_v = thiscos;
  
}



public void gyroscope(float thisx, float thisy, float thisz){
 
  g_x = thisx;
  g_y = thisy;
  g_z = thisz;
  //println("Gyroscope: "+ g_x + "," + g_y + "," + g_z);
  
  
}



public void linear_accel(float thisx, float thisy, float thisz){
 
  
  l_x = round(thisx);
  l_y = round(thisy);
  l_z = thisz;
 //println(round(l_x)+","+round(l_y));
 
 
 
 if(count == 0){
  
   cx = ix;
   cy = iy;
   px = cx;
   py = cy; 
   count+=1;
   
   
 }
 else{
   
  cx = cx + (0.5)*l_x*(0.5*0.5);
  cy = cy + (0.5)*l_y*(0.5*0.5);
  
 }
 
 //println(round(g_x)+","+round(g_y));
 
 /*

 float temp1 = map(thisx, -10, 10, 0, width);
 float temp2 = map(thisy, -10, 10, 0, width);
 
 float x1 = round(l_x);
 float y1 = round(l_y);
 
  if(count ==0){
  ix = x1;
  iy = y1;
  cx = x1*100;
  cy = y1*100;
  px = cx;
  py = cy;
  count+=1;;
  }
  else{
      
      cx = x1*100;
      cy = y1*100;
      
  }*/
  
 // println("Linear Acceleration: "+ x1 + "," + y1 );
  //println("Linear Acceleration: "+ x1 + "," + y1 );
  //println("Linear Acceleration: "+ diffx + "," + diffy );
  // println("Linear Acceleration: "+ thisx + "," + pax );
}
void draw(){

//  println(testr+" "+testg+" "+testb);
  testr = random(10,255);
  testb = random(10,255);
  testg = random(10,255);
  stroke(testr,testg,testb);
  //stroke(255,0,0);
  strokeWeight(10);
  strokeCap(SQUARE);
 // rotateX(anglex);
  //rotateY(angley);
  //translate(width/2, height/2);
  //rotate(cos_v);
  line(cx,cy,px,py);
  
  
    
    px = cx;
    py = cy;
  
  // println(storex);
  
  
  
}

void oscEvent(OscMessage themessage){
  
  if(themessage.isPlugged()==false){
  println("### received an osc message.");
  println("### addrpattern\t"+themessage.addrPattern());
  println("### typetag\t"+themessage.typetag());
  }
  
}
