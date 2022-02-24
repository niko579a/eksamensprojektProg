class Soldier extends Movement{
  float jumpSpeed = 8;
  float currentHeight = 0; //hvor højt han er i hoppet. 
  float jumpMaxHeight = 80;
  
  PImage soldat;
  
  boolean isMoving = false; //tjekker om spilleren bevæger sig
  boolean isMovingLeft = false; //hvis false bevæger man sig til højre,tjekker om man går til venstre. 
  boolean isOnPlatform = false;
  boolean reachedMaxJumpH = false;
  
  Soldier(float x_, float y_){
    w = 10;
    h = 10;

    position.x = x_;
    position.y = y_;
    velocity.y = -jumpSpeed;
    soldat = loadImage("soldatStanding.png");
    moveSpeed = 3;
  }
  
  void display(){
    image(soldat, position.x, position.y, 125, 200);
  }
  
  void move(){
    if(key == 'a' || keyCode == LEFT){
      isMoving = true;
      isMovingLeft = true;
    }
    if(key == 'd' || keyCode == RIGHT){
      isMoving = true;
      isMovingLeft = false;
    }
  }
  
  void update(PVector gravity){
    stayOnScreen();
    
    if(currentHeight == jumpMaxHeight){
      reachedMaxJumpH = true;
    }
    
    if(isMoving == true){
      if(isMovingLeft == true){
        position.x -= moveSpeed;
      } else{
        position.x += moveSpeed;
      }
    }
    
    if(currentHeight < jumpMaxHeight && isOnPlatform == true){
      //position.add(velocity);
      //currentHeight += jumpSpeed;
    }else{
      if(isOnPlatform == false){
        position.add(gravity);
      }
    }
  }
  
  void stayOnScreen(){ //HUSK RET BUG
    if(position.x <= 0){
      position.x = 0;
    } else if(position.x + w >= width){
      position.x = width - w;
    }
  }
  
  void jump(){
    if(key == ' '){
      if(isOnPlatform == true){
        if(isOnPlatform == true){
          isOnPlatform = false;
        }
      }
    }
    
    if(currentHeight < jumpMaxHeight){
      position.add(velocity);
      currentHeight += jumpSpeed;
     }
   }
}
