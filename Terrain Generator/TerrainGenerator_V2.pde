import g4p_controls.*; //GUI Library
import peasy.*;        //A camera library for the scene

/*
  Our mesh is like a grid that consists of some shape(see String mesh below),it will have columns and rows,
  with cols value to be the number of columns and rows to be how many of that shape each row will have
*/
int cols,rows;
//Initial height and width of our mesh
int w = 1200,h = 800;
//The sides length of the shapes in the mesh
int scale = 40;
//The range that Z values can change between (if seed is 10,then -10 <= Z <= 10)
int seed;
//RGB color values to fill the shape with should the option Fill be set to true
int fillR,fillB,fillG;
//GrayScale color for the scene background
int backgroundColor;
//GrayScale color for the outline of the shapes in the mesh
int strokeColor;
//Directional Light XYZ Coordinates
int DLightX,DLightY,DLightZ; 


//Angle values to rotate about X,Y,Z axies.For example : if xrot is 60,the scene will be rotated 60 degrees in a counterclockwise direction
float xrot,yrot,zrot;
//A 2D array holding the randomly generaited Z values for each terrain[x,y] point
float[][] terrain; 
//The height and width of our mesh
float H,W; 
//RGB Values for ambient Light
float ALightR,ALightG,ALightB; 
//RGB Values for directional Light
float DLightR,DLightG,DLightB; 

/*
  The movement scheme of our program.Please see draw() below.
*/
float move;
float speed;
float xChange,yChange;

//Following booleans can be changed by the user in the UI
boolean IsWholeImage; //Wether to draw an entire image on the grid
boolean Stroke;       //Whether the shapes drawn will have outline
boolean Fill;
boolean Light;
boolean texture;
boolean Recording;
boolean Forward;     //Movement direction,if false the

/*
*If true the Z-values changing algorithm will be calculated using "classic Perlin noise" from 1983 (not the newer "simplex noise" method from 2001),
*else will be calculated using random() function.
*/
boolean Perlin; 

//Ambient Light
boolean ALight; 
//Directional Light
boolean DLight; 

/*
Shape Type,can be .Changable by the user from UI
Shapes available are POINTS, LINES, TRIANGLES, TRIANGLE_FAN, TRIANGLE_STRIP, QUADS, and QUAD_STRIP 
*/
String mesh; 

/*
*An array that will hold color RGB color values that will be used to fill each sqaure in the mesh at coordinate [x][y] in case 'Whole Image' Option is selected
*/
color[][] a; 

//Look inside setup()
PeasyCam cam;
//Look inside setup()
PGraphics3D pg;

//The image to be diplayed as a texture for each triangle in the mesh in case Texture option is set to true.
PImage textureImage; 

//Images to be diplayed in the mesh in case option 'Whole Image' is selected.
PImage WholeImage;
PImage hoca;
PImage lake;
PImage SudaneseFlag;
PImage TurkishFlag;

/**
  Programs in Processing are like an arduino sketch,it will have a setup() function to initialize.
  Then there is the draw() method,which is an infinite loop that will run continuously
*/
public void setup(){
  size(1280, 740, P3D); //Initializing the windows with the defined sizes and with P3D renderer.
  createGUI(); //A method in the 'gui' file used to create and initialize GUI elements
  
  cols = w/scale; // Calculating how many columns  the mesh is going to have
  rows = h/scale; // Calculating how many rowathe mesh is going to have
  seed = 100; // Setting Initial Value of the seed for randomness algorithms to 100
  mesh = "TRIANGLE_STRIP"; //Setting default shape to a triangle mesh 
  terrain = new float[cols][rows]; //We will have a Z value for each [x][y] vertex
  
  //Giving initial values to various attributes
  fillR = 100;
  fillG = 100;
  fillB = 100;
  ALightR = 100;
  ALightG = 100;
  ALightB = 100;
  DLightR = 100;
  DLightG = 100;
  DLightB = 100;
  backgroundColor = 150;
  strokeColor = 200;
  speed = 0.1;
  xChange = 0.2;
  yChange = 0.2;
  xrot = PI/3;
  yrot = 0;
  zrot = 0;
  
  Stroke = true;
  Fill   = false;
  ALight = false;
  DLight = false;
  texture = false;
  Recording  = false;
  Forward = true;
  Perlin = true;
  
  //Loading images from thee data folder
  textureImage = loadImage("grass.jpg");
  //hoca         = loadImage("grass.jpg");
  lake         =  loadImage("lake.jpg");
  SudaneseFlag = loadImage("SudaneseFlag.jpg");
  TurkishFlag  = loadImage("TurkishFlag.png");
  WholeImage = lake;
  textureImage.resize(scale,scale);

  /**
  *The Object we will cal the drawing methodes on.
  *Important,if we call the drawing methodes directly the commands will be executed on the entire gui,instead of the view part we defined for it.
  */
  pg = (PGraphics3D) Terrain.getGraphics();
  
  /**
  *PeasyCam isa quick way to add a camera that supports rotating,zooming... to our scene.
  *The second parameter is the camera distance from the scene.
  *For more about PeasyCam,please see https://mrfeinberg.com/peasycam/ 
  */
  cam = new PeasyCam(this,pg,Terrain.getWidth() / 2 - 100);
  
  //The lookAt() method sets the focus point which the camera will rotate/zoom about.
  cam.lookAt(Terrain.getWidth() / 2 + 50,Terrain.getHeight() / 2,0);
  
  H = Terrain.getWidth();  //Initial width of our mesh,can be changed later from GUI
  W = Terrain.getHeight(); //Initial height of our mesh,can be changed later from GUI
  
  /**
  *Setting the texture mode to 'NORMAL' instead of the default 'IMAGE' so that the texure can later be mapped to values between 0 and 1 instead of between 0 and actual Image size
  *For more information see https://processing.org/reference/textureMode_.html
  */
  pg.textureMode(NORMAL);
  
}

  /*
  *As mentioned the draw function is an infinite loop.We will draw and update the scen according to values the user provide through the GUI
  *The methodes here have to be called continously else it will only show effect for one time that is why we are not calling them in the setup function
  */

void draw() {
  
  //Setting the background color of the controlling GUI (not the terrain scene) to white
  this.background(225);
  fill(0);
  //Drawing a black rectangle around the terrain scene
  rect(Terrain.getX(),Terrain.getY(),Terrain.getWidth(),Terrain.getHeight());
  
  /**
  *Setting the texture mode to 'NORMAL' instead of the default 'IMAGE' so that the texure can later be mapped to values between 0 and 1 instead of between 0 and actual Image size
  *For more information see https://processing.org/reference/textureMode_.html
  */
  
  pg.beginDraw();
  
  // A Value between 0 and 255 taken from a slider in the GUI
  pg.background(backgroundColor);
  
  if(Stroke) {
    pg.stroke(strokeColor); // A Value between 0 and 255 taken from a slider in the GUI
  } else {
    pg.noStroke(); //When called shapes drawn will have no outline
  }
  
  if(Fill) {
    pg.fill(fillR,fillG,fillB); //an RGB color. Values taken from GUI
    
  } else {
    pg.noFill();
  }
  
  
  if(DLight) {
      //The first three parameters are the RGB values of light,and the last three are it's direction,according to the XYZ cooridinates
      pg.directionalLight(DLightR, DLightG, DLightB, DLightX, DLightY, DLightZ);
  }
  
  if(ALight) {
      //Ambient Light is evenly disributed on the whole surface and only takes color parameters
      pg.ambientLight(ALightR, ALightG, ALightB);
  } 


/*******************************************Important********************************************************
  In computers,the origin coordinate (0,0) is usually set to be the top left corner of the screen.
  Alas our program requires the origin to be at the center,so we will use the translate() function to shift it vertical by height/2 and horizontally by width/2 -100
  
  After that we will rotate about the X,Y,Z axies in a way that shows the Z value (depth) of the shapes in the mesh
  Initially we will rotate the X axis by PI/3,the user can change the rotation values from the GUI
  
*************************************************************************************************************/

  pg.translate(W/2 - 100,H/2);
  pg.rotateX(xrot);
  pg.rotateY(yrot);
  pg.rotateZ(zrot);
  pg.translate(-W/2 + 100,-H/2);
  
    //In case WholeImage option is enabled we will fill the color array with the color of each pixel [x][y] in the image
    if(IsWholeImage) {
      
      //We have to make sure the mesh and the image are of equal size as we are treating each square as a pixel
      WholeImage.resize((int)cols,(int)rows);
      //pg.image(WholeImage,0,0);
      
      a = new color[(int)cols][(int)rows];
      
          for(int i = 0;i < cols;i++) {
            for (int j = 0;j < rows;j++) {
             a[i][j] = WholeImage.get(i,j); //Image.get(x,y) will retrive the color at (x,y)
            }
          }
      
    }
    
    
/****************************************************************IF Algorithm is Perlin Noise**********************************************************************

 In Processing,all shapes are constructed by connecting a series of vertices.
 You can draw lines for each side of your shape,or use some ready functions like rectangle(),ellipse(),sphere...etc.
 However,in our case the shapes we are going to draw are not going to be regular shapes,so we are going to use the following method :
 
  1- Call beginShape(MeshType) Function.
  2- Traverse the mesh : We will visit each (x,y) coordinate in our mesh and call vertex(x,y,z) function a number of times according to the mesh type choosen.
     vertex() is used to specify the vertex coordinates for points, lines, triangles, quads, and polygons.
     It is used exclusively within the beginShape() and endShape() functions.
     The 'scale' variable is used to define the length of the sides of our shapes,so for example if we wanted to define a sqaure :
                                   (x * scale,y*scale    )           ((x+1) * scale,y*scale    )



                                   (x * scale,(y+1)*scale)           ((x+1) * scale,(y+1)*scale)
                                   
   our veticies may looke like this.
   The magic is happening here though,the Z values are going to be choosen from the terrain[][] array which is filled by noise() according to Perlin Noise algorithm.
   These Z values are going to change each time we go through the loop according to our algorithm (move,speed,x/yOffset...) , thus, giving the 'illusion of moving'
       
  3- Call endShape()/endShape(CLOSE) : at this point all the vertices are defined,and the function will draw a shape according to the parameters we gave it.

  For more information see https://processing.org/reference/beginShape_.html , https://processing.org/reference/endShape_.html , https://processing.org/reference/vertex_.html


********************************************************************************************************************************************************************/

/****************************************************************Texture and Whole Image****************************************************************************
Texture :
  If texture is enabled,we will call texture(Image) method after calling beginShape and before any vertix() call.
  Also note that the last 2 parameters in vertex(x,y,z,mapping1,mapping2) a re used to map the texture to the image,
  and since we set the texture mode to Normal,we will only use values between 0 and 1 instead of actual image size.
WholeImage :
  Drawing the whole image is simple,as stated previously we can do this by just treating each rectangle/square/shape... we draw as a pixel,
  and we will fill it with a color depending on it's [x,y] position which is going to b parallel to the specific pixel at [x,y] position in the orijinal image.
  The colors have already been prepared above and feeded to color[][] array.
  
********************************************************************************************************************************************************************/


  if(Perlin) {   
    
  /*
  The movement scheme of our program.
  -Each time we loop,we will pick Z values for each[x,y] point in our mesh from Perlin Noise Infinite Space
  -'move' will be the initial y coordinate in the Perlin Noise Space,it will be incremented/decremented by speed according to the movement direction (Forward/Backward)
  -'xChange' and 'yChange' are the values that will be added to the initial x,y values to get new Z values for the next (x,y) point
  */
  
  //For more about Perlin Noise please see https://en.wikipedia.org/wiki/Perlin_noise

   if(Forward) {
     move -= speed;
   } else {
     move += speed;
   }
  
   float yOff = move;
  
 
   for(int y = 0;y < rows;y++) {
   float xOff = 0;
   for(int x = 0;x < cols;x++) {
      /**
      *Assigning random Z values to vertecies at each [x][y] coordinate.
      *The values are generated in the 'noise' method using the Perlin Noise algorithm.
      *But the function only generate values between 0 and 1.Which is not enough and won't give the feeling of 3D
      *so we will scale every entry by the amount of the seed.
      *We are using the map function.It will take the value generated by the noise function which is between 0 and 1 and map it to a value between -seed and seed.
      */
     terrain[x][y] = map(noise(xOff,yOff),0,1,-seed,seed);
     xOff += xChange;
     }
     yOff += yChange;
  }
 
    switch (mesh) {
      
    case "POINTS" :
    
         for(int y = 0;y < rows;y++) {
          
           pg.beginShape(POINTS);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols;x++) {         
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
           }
           pg.endShape();
        }
    
    break;
    
    case "TRIANGLES" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLES);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
             pg.vertex((x+1) * scale,y*scale,terrain[x+1][y],1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,terrain[x+1][y+1],1,1);
           }
           pg.endShape();
        }
    
    break;
    

    case "TRIANGLE_FAN" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLE_FAN);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {  
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
             pg.vertex((x+1) * scale,y*scale,terrain[x+1][y],1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,terrain[x+1][y+1],1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "TRIANGLE_STRIP" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLE_STRIP);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {  
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
             pg.vertex((x+1) * scale,y*scale,terrain[x+1][y],1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,terrain[x+1][y+1],1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "QUADS" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(QUADS);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
             pg.vertex((x+1) * scale,y*scale,terrain[x+1][y],1,0);
             pg.vertex(x * scale,(y+1)*scale,terrain[x][y+1],0,1);
             pg.vertex((x+1) * scale,(y+1)*scale,terrain[x+1][y+1],1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "QUAD_STRIP" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(QUAD_STRIP);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,terrain[x][y],0,0);
             pg.vertex((x+1) * scale,y*scale,terrain[x+1][y],1,0);
             pg.vertex(x * scale,(y+1)*scale,terrain[x][y+1],0,1);
             pg.vertex((x+1) * scale,(y+1)*scale,terrain[x+1][y+1],1,1);
           }
           pg.endShape();
        }
    
    break;
    
    }

  } 
  
  else { 
    
/****************************************************************IF Algorithm is normal pseudo random() function****************************************************
  Same as perlin noise,but we will simply be using random() function for assigning a Z value
********************************************************************************************************************************************************************/

          switch (mesh) {
      
    case "POINTS" :
    
         for(int y = 0;y < rows;y++) {
          
           pg.beginShape(POINTS);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols;x++) {         
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
           }
           pg.endShape();
        }
    
    break;
    
    case "TRIANGLES" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLES);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
             pg.vertex((x+1) * scale,y*scale,random(-seed,seed),1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,random(-seed,seed),1,1);
           }
           pg.endShape();
        }
    
    break;
    

    case "TRIANGLE_FAN" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLE_FAN);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {     
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
             pg.vertex((x+1) * scale,y*scale,random(-seed,seed),1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,random(-seed,seed),1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "TRIANGLE_STRIP" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(TRIANGLE_STRIP);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {  
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
             pg.vertex((x+1) * scale,y*scale,random(-seed,seed),1,0);
             pg.vertex((x+1) * scale,(y+1)*scale,random(-seed,seed),1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "QUADS" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(QUADS);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
             pg.vertex((x+1) * scale,y*scale,random(-seed,seed),1,0);
             pg.vertex(x * scale,(y+1)*scale,random(-seed,seed),0,1);
             pg.vertex((x+1) * scale,(y+1)*scale,random(-seed,seed),1,1);
           }
           pg.endShape();
        }
    
    break;
    
    case "QUAD_STRIP" :
    
         for(int y = 0;y < rows - 1;y++) {
          
           pg.beginShape(QUAD_STRIP);
           
           if(texture) pg.texture(textureImage);
           for(int x = 0;x < cols - 1;x++) {
             if(IsWholeImage) pg.fill(a[x][y]);
             pg.vertex(x * scale,y*scale,random(-seed,seed),0,0);
             pg.vertex((x+1) * scale,y*scale,random(-seed,seed),1,0);
             pg.vertex(x * scale,(y+1)*scale,random(-seed,seed),0,1);
             pg.vertex((x+1) * scale,(y+1)*scale,random(-seed,seed),1,1);
           }
           pg.endShape();
        }
    
    break;
    
    }
    
  }
  
/***************************************************************Recording*************************************************************************
   When the use activates recording function,we will save each frame as a png picture to the folder 'output' inside the sketch folder.
   You can set the output folder as an absoloute path if you like (e.g. 'C\Users\...')
   Later the user can use any program he wants to turn these pictures into an animation video.
   Note that there will be significant performance loose when recording.
***************************************************************************************************************************************************/
    
    if(Recording) {
      pg.save("output/terrain_" + day() + "_" + hour() + "_" + second() + ".png");
      pg.fill(255,0,0);
    } else {
      pg.fill(0,255,0);
    }

    /*
      To indicate the state of drawing we will draw a circle at the bottom middle of the scene,it will be green when not recording,red otherwise.
      beginHUD() and endHUD() are used to temporarly reset the coordinates and other transformations done,
      because if we try to draw the circle directly it will be drawn on top of the mesh
    */
    
    //Note that since we are drawing the circle after calling save(),the circle will not appear in the final picture.
    cam.beginHUD();
    pg.ellipse(Terrain.getWidth()/2,Terrain.getHeight() - 50,20,20);
    cam.endHUD();


   pg.endDraw();
  
}
