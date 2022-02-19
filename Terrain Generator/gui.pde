/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void changeBackground(GCustomSlider source, GEvent event) { //_CODE_:backgroundSlider:584425:
  int a = source.getValueI();
  backgroundColor = a;
} //_CODE_:backgroundSlider:584425:

public void changeStroke(GCustomSlider source, GEvent event) { //_CODE_:strokeSlider:970986:
  int a = source.getValueI();
  strokeColor = a;
} //_CODE_:strokeSlider:970986:

public void UploadTexture(GButton source, GEvent event) { //_CODE_:button1:648120:
  String path = textureImagePath.getText();
  PImage newImage;
  PGraphics3D pg2;
  
  try {
    newImage = loadImage(path);
    newImage.resize((int)Texture.getWidth(),(int)Texture.getHeight());
  } catch(Exception ex) {
    println("Exception : Error when loadin image from path.");
    return;
  }
  
  println("Basari Image Yukleme");
  pg2 = (PGraphics3D) Texture.getGraphics();
  pg2.beginDraw();
  pg2.image(newImage,0,0);
  pg2.endDraw();
  println("Basari : p2.Image");
  textureImage = newImage;
  textureImage.resize(scale,scale);
  
  
} //_CODE_:button1:648120:

public void changeZRotate(GCustomSlider source, GEvent event) { //_CODE_:rotateZSlider:349901:
  zrot = map (source.getValueF(), 0, 360,0, 2 * PI);
} //_CODE_:rotateZSlider:349901:

public void changeYRotate(GCustomSlider source, GEvent event) { //_CODE_:rotateYSlider:549069:
  yrot = map (source.getValueF(), 0, 360,0, 2 * PI);
} //_CODE_:rotateYSlider:549069:

public void changeXRotate(GCustomSlider source, GEvent event) { //_CODE_:rotateXSlider:707506:
  xrot = map (source.getValueF(), 0, 360,0, 2 * PI);
} //_CODE_:rotateXSlider:707506:

public void changeAlgorithm(GDropList source, GEvent event) { //_CODE_:algorithmList:652610:
  if(source.getSelectedText().equals("Perlin Noise")) {
    Perlin = true;
  } else {
    Perlin = false;
  }
} //_CODE_:algorithmList:652610:

public void changeScale(GCustomSlider source, GEvent event) { //_CODE_:scaleSlider:293145:
  scale = source.getValueI();
  cols = w/scale;
  rows = h/scale;
  terrain = new float[cols][rows];
  textureImage.resize(scale,scale);
} //_CODE_:scaleSlider:293145:

public void changeSeed(GCustomSlider source, GEvent event) { //_CODE_:seedSlider:982611:
   float v = source.getValueF();
   seed = (int)v;
} //_CODE_:seedSlider:982611:

public void changeMeshType(GDropList source, GEvent event) { //_CODE_:dropList2:345924:
  if(source.getSelectedText().equals("POINTS")) {
    mesh = "POINTS";
  } else if(source.getSelectedText().equals("TRIANGLES")) {
    mesh = "TRIANGLES";
  } else if(source.getSelectedText().equals("TRIANGLE_FAN")) {
    mesh = "TRIANGLE_FAN";
  } else if(source.getSelectedText().equals("TRIANGLE_STRIP")) {
    mesh = "TRIANGLE_STRIP";
  } else if(source.getSelectedText().equals("QUADS")) {
    mesh = "QUADS";
  } else {
    mesh = "QUAD_STRIP";
  }
} //_CODE_:dropList2:345924:

public void changeHeight(GCustomSlider source, GEvent event) { //_CODE_:HeightSlider:567026:
  float v = source.getValueF();
  H = v;
  cols = (int) W/scale;
  rows = (int) H/scale;
  terrain = new float[cols][rows];
} //_CODE_:HeightSlider:567026:

public void changeWidth(GCustomSlider source, GEvent event) { //_CODE_:WidthSlider:477448:
  float v = source.getValueF();
  W = v;
  cols = (int) W/scale;
  rows = (int) H/scale;
  terrain = new float[cols][rows];
  
} //_CODE_:WidthSlider:477448:

public void setStroke(GCheckbox source, GEvent event) { //_CODE_:checkbox1:649923:
  Stroke = ! Stroke;
} //_CODE_:checkbox1:649923:

public void setFill(GCheckbox source, GEvent event) { //_CODE_:hasFill:585199:
  Fill = !Fill;
} //_CODE_:hasFill:585199:

public void changeFillB(GCustomSlider source, GEvent event) { //_CODE_:FillBSlider:424316:
  int v = source.getValueI();
  fillB = v;
} //_CODE_:FillBSlider:424316:

public void changeFillG(GCustomSlider source, GEvent event) { //_CODE_:FillGSlider:895822:
  int v = source.getValueI();
  fillG = v;
} //_CODE_:FillGSlider:895822:

public void changeFillR(GCustomSlider source, GEvent event) { //_CODE_:FillRSlider:757380:
  int v = source.getValueI();
  fillR = v;
} //_CODE_:FillRSlider:757380:

public void changeDirection(GDropList source, GEvent event) { //_CODE_:dropList:911716:
  if(source.getSelectedText().equals("Forward")) {
    Forward = true;
  } else if(source.getSelectedText().equals("Backward")) {
    Forward = false;
  }
} //_CODE_:dropList:911716:

public void changeSpeed(GCustomSlider source, GEvent event) { //_CODE_:speedSlider:744815:
  float s = source.getValueF();
  speed = map(s,0,20,0.01,0.2);
} //_CODE_:speedSlider:744815:

public void changeYOff(GCustomSlider source, GEvent event) { //_CODE_:yOffSlider:420350:
  float v = source.getValueF();
  yChange = map(v,-10,10,-1.0,1.0);
} //_CODE_:yOffSlider:420350:

public void changeXOff(GCustomSlider source, GEvent event) { //_CODE_:xOffSlider:306332:
  float v = source.getValueF();
  xChange = map(v,-10,10,-1.0,1.0);
} //_CODE_:xOffSlider:306332:

public void setTexture(GCheckbox source, GEvent event) { //_CODE_:hasTexture:813465:
  texture = !texture;
} //_CODE_:hasTexture:813465:

public void setDirectionalLight(GCheckbox source, GEvent event) { //_CODE_:hasDirectionalLight:344708:
  DLight = !DLight;
} //_CODE_:hasDirectionalLight:344708:

public void setAmbientLight(GCheckbox source, GEvent event) { //_CODE_:hasAmbientLight:766092:
  ALight = !ALight;
} //_CODE_:hasAmbientLight:766092:

public void changeDLightB(GCustomSlider source, GEvent event) { //_CODE_:custom_slider1:353680:
  int v = source.getValueI();
  DLightB = v;
} //_CODE_:custom_slider1:353680:

public void changeDLightG(GCustomSlider source, GEvent event) { //_CODE_:custom_slider2:911505:
  int v = source.getValueI();
  DLightG = v;
} //_CODE_:custom_slider2:911505:

public void changeDLightR(GCustomSlider source, GEvent event) { //_CODE_:custom_slider3:756081:
  int v = source.getValueI();
  DLightR = v;
} //_CODE_:custom_slider3:756081:

public void changeDLightZ(GDropList source, GEvent event) { //_CODE_:dropList3:246356:
    if(source.getSelectedText().equals("1")) {
    DLightZ = 1;
  } else if(source.getSelectedText().equals("0")) {
    DLightZ = 0;
  } else {
    DLightZ = -1;
  }
} //_CODE_:dropList3:246356:

public void changeDLightY(GDropList source, GEvent event) { //_CODE_:dropList4:333972:
    if(source.getSelectedText().equals("1")) {
    DLightY = 1;
  } else if(source.getSelectedText().equals("0")) {
    DLightY = 0;
  } else {
    DLightY = -1;
  }
} //_CODE_:dropList4:333972:

public void changeDLightX(GDropList source, GEvent event) { //_CODE_:dropList5:612801:
  if(source.getSelectedText().equals("1")) {
    DLightX = 1;
  } else if(source.getSelectedText().equals("0")) {
    DLightX = 0;
  } else {
    DLightX = -1;
  }
} //_CODE_:dropList5:612801:

public void changeALightB(GCustomSlider source, GEvent event) { //_CODE_:custom_slider4:348795:
  int v = source.getValueI();
  ALightB = v;
} //_CODE_:custom_slider4:348795:

public void changeALightG(GCustomSlider source, GEvent event) { //_CODE_:custom_slider5:771312:
  int v = source.getValueI();
  ALightG = v;
} //_CODE_:custom_slider5:771312:

public void changeALightR(GCustomSlider source, GEvent event) { //_CODE_:custom_slider6:698596:
  int v = source.getValueI();
  ALightR = v;
} //_CODE_:custom_slider6:698596:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textureImagePath:743948:
  println("textureImagePath - GTextField >> GEvent." + event + " @ " + millis());
} //_CODE_:textureImagePath:743948:

public void changeWholeImage(GDropList source, GEvent event) { //_CODE_:dropList1:750401:
  if(source.getSelectedText().equals("Hoca")) {
    WholeImage = lake;
  } else if(source.getSelectedText().equals("Lake")) {
    WholeImage = lake;
  } else if(source.getSelectedText().equals("SudaneseFlag")) {
    WholeImage = SudaneseFlag;
  } else if(source.getSelectedText().equals("TurkishFlag")) {
    WholeImage = TurkishFlag;
  } 
} //_CODE_:dropList1:750401:

public void setWholeImage(GCheckbox source, GEvent event) { //_CODE_:checkbox2:569774:
  IsWholeImage = !IsWholeImage;
} //_CODE_:checkbox2:569774:

public void hasRecord(GCheckbox source, GEvent event) { //_CODE_:Record:261563:
  Recording = !Recording;
} //_CODE_:Record:261563:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  Terrain = new GView(this, 240, 40, 800, 600, P3D);
  backgroundSlider = new GCustomSlider(this, 90, 480, 110, 50, "grey_blue");
  backgroundSlider.setShowValue(true);
  backgroundSlider.setShowLimits(true);
  backgroundSlider.setLimits(200, 0, 255);
  backgroundSlider.setShowTicks(true);
  backgroundSlider.setNumberFormat(G4P.INTEGER, 0);
  backgroundSlider.setOpaque(false);
  backgroundSlider.addEventHandler(this, "changeBackground");
  strokeSlider = new GCustomSlider(this, 1150, 220, 100, 30, "grey_blue");
  strokeSlider.setShowValue(true);
  strokeSlider.setShowLimits(true);
  strokeSlider.setLimits(240, 0, 255);
  strokeSlider.setNumberFormat(G4P.INTEGER, 0);
  strokeSlider.setOpaque(false);
  strokeSlider.addEventHandler(this, "changeStroke");
  button1 = new GButton(this, 110, 50, 80, 30);
  button1.setText("Upload Texure");
  button1.addEventHandler(this, "UploadTexture");
  rotateZSlider = new GCustomSlider(this, 860, 10, 100, 20, "grey_blue");
  rotateZSlider.setShowValue(true);
  rotateZSlider.setShowLimits(true);
  rotateZSlider.setLimits(0, 0, 360);
  rotateZSlider.setNumberFormat(G4P.INTEGER, 0);
  rotateZSlider.setOpaque(false);
  rotateZSlider.addEventHandler(this, "changeZRotate");
  rotateYSlider = new GCustomSlider(this, 630, 10, 110, 20, "grey_blue");
  rotateYSlider.setShowValue(true);
  rotateYSlider.setShowLimits(true);
  rotateYSlider.setLimits(0, 0, 360);
  rotateYSlider.setNumberFormat(G4P.INTEGER, 0);
  rotateYSlider.setOpaque(false);
  rotateYSlider.addEventHandler(this, "changeYRotate");
  rotateXSlider = new GCustomSlider(this, 400, 10, 110, 20, "grey_blue");
  rotateXSlider.setShowValue(true);
  rotateXSlider.setShowLimits(true);
  rotateXSlider.setLimits(60, 0, 360);
  rotateXSlider.setNumberFormat(G4P.INTEGER, 0);
  rotateXSlider.setOpaque(false);
  rotateXSlider.addEventHandler(this, "changeXRotate");
  algorithmList = new GDropList(this, 90, 110, 110, 80, 3, 10);
  algorithmList.setItems(loadStrings("list_652610"), 0);
  algorithmList.addEventHandler(this, "changeAlgorithm");
  label1 = new GLabel(this, -10, 110, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Algorithm");
  label1.setOpaque(false);
  label = new GLabel(this, -10, 150, 80, 20);
  label.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label.setText("Seed");
  label.setOpaque(false);
  scaleSlider = new GCustomSlider(this, 90, 260, 110, 50, "grey_blue");
  scaleSlider.setShowValue(true);
  scaleSlider.setShowLimits(true);
  scaleSlider.setLimits(8, 5, 25);
  scaleSlider.setNumberFormat(G4P.INTEGER, 0);
  scaleSlider.setOpaque(false);
  scaleSlider.addEventHandler(this, "changeScale");
  seedSlider = new GCustomSlider(this, 90, 140, 110, 50, "grey_blue");
  seedSlider.setShowValue(true);
  seedSlider.setShowLimits(true);
  seedSlider.setLimits(100, 0, 250);
  seedSlider.setNumberFormat(G4P.INTEGER, 0);
  seedSlider.setOpaque(false);
  seedSlider.addEventHandler(this, "changeSeed");
  dropList2 = new GDropList(this, 90, 220, 110, 140, 6, 10);
  dropList2.setItems(loadStrings("list_345924"), 3);
  dropList2.addEventHandler(this, "changeMeshType");
  label3 = new GLabel(this, 0, 270, 80, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label3.setText("Scale");
  label3.setOpaque(false);
  label4 = new GLabel(this, 0, 220, 80, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label4.setText("Mesh Type");
  label4.setOpaque(false);
  label2 = new GLabel(this, 760, 10, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("RotateZ");
  label2.setOpaque(false);
  label5 = new GLabel(this, 530, 10, 80, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label5.setText("RotateY");
  label5.setOpaque(false);
  label6 = new GLabel(this, 300, 10, 80, 20);
  label6.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label6.setText("RotateX");
  label6.setOpaque(false);
  label7 = new GLabel(this, 0, 490, 80, 20);
  label7.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label7.setText("Background");
  label7.setOpaque(false);
  label8 = new GLabel(this, 1060, 380, 80, 20);
  label8.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label8.setText("G");
  label8.setOpaque(false);
  label9 = new GLabel(this, 1060, 310, 80, 20);
  label9.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label9.setText("R");
  label9.setOpaque(false);
  label10 = new GLabel(this, 0, 410, 80, 20);
  label10.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label10.setText("Height");
  label10.setOpaque(false);
  label11 = new GLabel(this, 0, 350, 80, 20);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("Width");
  label11.setOpaque(false);
  HeightSlider = new GCustomSlider(this, 90, 400, 110, 50, "grey_blue");
  HeightSlider.setShowValue(true);
  HeightSlider.setShowLimits(true);
  HeightSlider.setLimits(800, 0, 5000);
  HeightSlider.setNumberFormat(G4P.INTEGER, 0);
  HeightSlider.setOpaque(false);
  HeightSlider.addEventHandler(this, "changeHeight");
  WidthSlider = new GCustomSlider(this, 90, 340, 110, 50, "grey_blue");
  WidthSlider.setShowValue(true);
  WidthSlider.setShowLimits(true);
  WidthSlider.setLimits(1200, 0, 5000);
  WidthSlider.setNumberFormat(G4P.INTEGER, 0);
  WidthSlider.setOpaque(false);
  WidthSlider.addEventHandler(this, "changeWidth");
  checkbox1 = new GCheckbox(this, 1060, 220, 60, 20);
  checkbox1.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox1.setText("Stroke");
  checkbox1.setOpaque(false);
  checkbox1.addEventHandler(this, "setStroke");
  checkbox1.setSelected(true);
  hasFill = new GCheckbox(this, 1060, 270, 70, 20);
  hasFill.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  hasFill.setText("Fill");
  hasFill.setOpaque(false);
  hasFill.addEventHandler(this, "setFill");
  FillBSlider = new GCustomSlider(this, 1130, 450, 100, 40, "grey_blue");
  FillBSlider.setShowValue(true);
  FillBSlider.setShowLimits(true);
  FillBSlider.setLimits(100, 0, 255);
  FillBSlider.setNumberFormat(G4P.INTEGER, 0);
  FillBSlider.setOpaque(false);
  FillBSlider.addEventHandler(this, "changeFillB");
  FillGSlider = new GCustomSlider(this, 1130, 370, 100, 40, "grey_blue");
  FillGSlider.setShowValue(true);
  FillGSlider.setShowLimits(true);
  FillGSlider.setLimits(100, 0, 255);
  FillGSlider.setNumberFormat(G4P.INTEGER, 0);
  FillGSlider.setOpaque(false);
  FillGSlider.addEventHandler(this, "changeFillG");
  FillRSlider = new GCustomSlider(this, 1130, 300, 100, 40, "grey_blue");
  FillRSlider.setShowValue(true);
  FillRSlider.setShowLimits(true);
  FillRSlider.setLimits(100, 0, 255);
  FillRSlider.setNumberFormat(G4P.INTEGER, 0);
  FillRSlider.setOpaque(false);
  FillRSlider.addEventHandler(this, "changeFillR");
  label12 = new GLabel(this, 1060, 460, 80, 20);
  label12.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label12.setText("B");
  label12.setOpaque(false);
  label13 = new GLabel(this, 0, 560, 80, 20);
  label13.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label13.setText("Direction");
  label13.setOpaque(false);
  label14 = new GLabel(this, 0, 600, 80, 20);
  label14.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label14.setText("Speed");
  label14.setOpaque(false);
  dropList = new GDropList(this, 90, 560, 110, 80, 3, 10);
  dropList.setItems(loadStrings("list_911716"), 0);
  dropList.addEventHandler(this, "changeDirection");
  speedSlider = new GCustomSlider(this, 90, 590, 110, 50, "grey_blue");
  speedSlider.setShowValue(true);
  speedSlider.setShowLimits(true);
  speedSlider.setLimits(1.0, 0.0, 20.0);
  speedSlider.setNumberFormat(G4P.DECIMAL, 0);
  speedSlider.setOpaque(false);
  speedSlider.addEventHandler(this, "changeSpeed");
  yOffSlider = new GCustomSlider(this, 1130, 590, 100, 40, "grey_blue");
  yOffSlider.setShowValue(true);
  yOffSlider.setShowLimits(true);
  yOffSlider.setLimits(1, -10, 10);
  yOffSlider.setNumberFormat(G4P.INTEGER, 0);
  yOffSlider.setOpaque(false);
  yOffSlider.addEventHandler(this, "changeYOff");
  xOffSlider = new GCustomSlider(this, 1130, 530, 100, 40, "grey_blue");
  xOffSlider.setShowValue(true);
  xOffSlider.setShowLimits(true);
  xOffSlider.setLimits(2.0, -10.0, 10.0);
  xOffSlider.setNumberFormat(G4P.DECIMAL, 2);
  xOffSlider.setOpaque(false);
  xOffSlider.addEventHandler(this, "changeXOff");
  label15 = new GLabel(this, 1060, 600, 80, 20);
  label15.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label15.setText("Y Offset");
  label15.setOpaque(false);
  label16 = new GLabel(this, 1060, 540, 80, 20);
  label16.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label16.setText("X Offset");
  label16.setOpaque(false);
  Texture = new GView(this, 10, 10, 80, 60, P3D);
  hasTexture = new GCheckbox(this, 10, 80, 70, 20);
  hasTexture.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  hasTexture.setText("Texture");
  hasTexture.setOpaque(false);
  hasTexture.addEventHandler(this, "setTexture");
  hasDirectionalLight = new GCheckbox(this, 210, 680, 120, 20);
  hasDirectionalLight.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  hasDirectionalLight.setText("Directional Light");
  hasDirectionalLight.setOpaque(false);
  hasDirectionalLight.addEventHandler(this, "setDirectionalLight");
  hasAmbientLight = new GCheckbox(this, 40, 640, 120, 20);
  hasAmbientLight.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  hasAmbientLight.setText("Ambient Light");
  hasAmbientLight.setOpaque(false);
  hasAmbientLight.addEventHandler(this, "setAmbientLight");
  custom_slider1 = new GCustomSlider(this, 490, 650, 50, 40, "grey_blue");
  custom_slider1.setShowValue(true);
  custom_slider1.setShowLimits(true);
  custom_slider1.setLimits(50, 0, 255);
  custom_slider1.setShowTicks(true);
  custom_slider1.setNumberFormat(G4P.INTEGER, 0);
  custom_slider1.setOpaque(false);
  custom_slider1.addEventHandler(this, "changeDLightB");
  custom_slider2 = new GCustomSlider(this, 420, 650, 50, 40, "grey_blue");
  custom_slider2.setShowValue(true);
  custom_slider2.setShowLimits(true);
  custom_slider2.setLimits(50, 0, 255);
  custom_slider2.setShowTicks(true);
  custom_slider2.setNumberFormat(G4P.INTEGER, 0);
  custom_slider2.setOpaque(false);
  custom_slider2.addEventHandler(this, "changeDLightG");
  custom_slider3 = new GCustomSlider(this, 340, 650, 50, 40, "grey_blue");
  custom_slider3.setShowValue(true);
  custom_slider3.setShowLimits(true);
  custom_slider3.setLimits(1, 0, 255);
  custom_slider3.setShowTicks(true);
  custom_slider3.setNumberFormat(G4P.INTEGER, 0);
  custom_slider3.setOpaque(false);
  custom_slider3.addEventHandler(this, "changeDLightR");
  dropList3 = new GDropList(this, 700, 650, 50, 80, 3, 10);
  dropList3.setItems(loadStrings("list_246356"), 0);
  dropList3.addEventHandler(this, "changeDLightZ");
  dropList4 = new GDropList(this, 630, 650, 50, 80, 3, 10);
  dropList4.setItems(loadStrings("list_333972"), 0);
  dropList4.addEventHandler(this, "changeDLightY");
  dropList5 = new GDropList(this, 570, 650, 50, 80, 3, 10);
  dropList5.setItems(loadStrings("list_612801"), 0);
  dropList5.addEventHandler(this, "changeDLightX");
  label17 = new GLabel(this, 630, 690, 30, 20);
  label17.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label17.setText("Y");
  label17.setOpaque(false);
  label18 = new GLabel(this, 570, 690, 30, 20);
  label18.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label18.setText("X");
  label18.setOpaque(false);
  label19 = new GLabel(this, 500, 690, 30, 20);
  label19.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label19.setText("B");
  label19.setOpaque(false);
  label20 = new GLabel(this, 430, 690, 30, 20);
  label20.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label20.setText("G");
  label20.setOpaque(false);
  label21 = new GLabel(this, 350, 690, 30, 20);
  label21.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label21.setText("R");
  label21.setOpaque(false);
  label22 = new GLabel(this, 700, 690, 30, 20);
  label22.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label22.setText("Z");
  label22.setOpaque(false);
  custom_slider4 = new GCustomSlider(this, 130, 680, 50, 40, "grey_blue");
  custom_slider4.setShowValue(true);
  custom_slider4.setShowLimits(true);
  custom_slider4.setLimits(1, 0, 255);
  custom_slider4.setNumberFormat(G4P.INTEGER, 0);
  custom_slider4.setOpaque(false);
  custom_slider4.addEventHandler(this, "changeALightB");
  custom_slider5 = new GCustomSlider(this, 60, 680, 50, 40, "grey_blue");
  custom_slider5.setShowValue(true);
  custom_slider5.setShowLimits(true);
  custom_slider5.setLimits(1, 0, 255);
  custom_slider5.setNumberFormat(G4P.INTEGER, 0);
  custom_slider5.setOpaque(false);
  custom_slider5.addEventHandler(this, "changeALightG");
  custom_slider6 = new GCustomSlider(this, 0, 680, 50, 40, "grey_blue");
  custom_slider6.setShowValue(true);
  custom_slider6.setShowLimits(true);
  custom_slider6.setLimits(1, 0, 255);
  custom_slider6.setNumberFormat(G4P.INTEGER, 0);
  custom_slider6.setOpaque(false);
  custom_slider6.addEventHandler(this, "changeALightR");
  textureImagePath = new GTextField(this, 100, 20, 120, 20, G4P.SCROLLBARS_NONE);
  textureImagePath.setOpaque(true);
  textureImagePath.addEventHandler(this, "textfield1_change1");
  dropList1 = new GDropList(this, 1160, 90, 90, 100, 4, 10);
  dropList1.setItems(loadStrings("list_750401"), 0);
  dropList1.addEventHandler(this, "changeWholeImage");
  checkbox2 = new GCheckbox(this, 1050, 90, 100, 20);
  checkbox2.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  checkbox2.setText("Whole Image");
  checkbox2.setOpaque(false);
  checkbox2.addEventHandler(this, "setWholeImage");
  Record = new GCheckbox(this, 921, 652, 75, 19);
  Record.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  Record.setText("Record");
  Record.setOpaque(false);
  Record.addEventHandler(this, "hasRecord");
}

// Variable declarations 
// autogenerated do not edit
GView Terrain; 
GCustomSlider backgroundSlider; 
GCustomSlider strokeSlider; 
GButton button1; 
GCustomSlider rotateZSlider; 
GCustomSlider rotateYSlider; 
GCustomSlider rotateXSlider; 
GDropList algorithmList; 
GLabel label1; 
GLabel label; 
GCustomSlider scaleSlider; 
GCustomSlider seedSlider; 
GDropList dropList2; 
GLabel label3; 
GLabel label4; 
GLabel label2; 
GLabel label5; 
GLabel label6; 
GLabel label7; 
GLabel label8; 
GLabel label9; 
GLabel label10; 
GLabel label11; 
GCustomSlider HeightSlider; 
GCustomSlider WidthSlider; 
GCheckbox checkbox1; 
GCheckbox hasFill; 
GCustomSlider FillBSlider; 
GCustomSlider FillGSlider; 
GCustomSlider FillRSlider; 
GLabel label12; 
GLabel label13; 
GLabel label14; 
GDropList dropList; 
GCustomSlider speedSlider; 
GCustomSlider yOffSlider; 
GCustomSlider xOffSlider; 
GLabel label15; 
GLabel label16; 
GView Texture; 
GCheckbox hasTexture; 
GCheckbox hasDirectionalLight; 
GCheckbox hasAmbientLight; 
GCustomSlider custom_slider1; 
GCustomSlider custom_slider2; 
GCustomSlider custom_slider3; 
GDropList dropList3; 
GDropList dropList4; 
GDropList dropList5; 
GLabel label17; 
GLabel label18; 
GLabel label19; 
GLabel label20; 
GLabel label21; 
GLabel label22; 
GCustomSlider custom_slider4; 
GCustomSlider custom_slider5; 
GCustomSlider custom_slider6; 
GTextField textureImagePath; 
GDropList dropList1; 
GCheckbox checkbox2; 
GCheckbox Record; 
