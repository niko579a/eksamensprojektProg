class Platform{
  float x;
  float y;
  float w;
  float h = 8;
  
  boolean showPlatform = true; //gør at linjen i bunden kan blive usynlig
  
  Platform(float x_, float y_, float w_){
    x = x_;
    y = y_;
    w = w_;
  }
  
  void display(){
    if(showPlatform == true){
      fill(0);
      rect(x, y, w, h);
    }
  }
  
  void isSoldierOnPlatform(Soldier player){
    float playerFeetX = player.position.x;
    float playerFeetY = player.position.y + 200;
    
    if((playerFeetX + 125) >= x && playerFeetX <= (x + w) && playerFeetY >= y && playerFeetY <= (y + h)){
      player.isOnPlatform = true;
      player.currentHeight = 0;
      player.position.y = y - 190;
    }
  }
}
