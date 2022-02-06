class World{
  ArrayList<Platform> allPlatforms = new ArrayList<Platform>();
  
  PImage baggrund;
  
  PVector gravity = new PVector(0, 4.82);
  
  Soldier player;
  Platform groundPlatform; //den usynlige linje i bunden 
  
  World(){
    player = new Soldier(150, 450);
    groundPlatform = new Platform(-100, 650, 1600);
    groundPlatform.showPlatform = false; 
    allPlatforms.add(groundPlatform); //tilføjer linjen i bunden til arraylisten
    baggrund = loadImage("world.png");
  }
  
  void display(){
    image(baggrund, 0, 0);
    player.display();
    for(int i = 0; i < allPlatforms.size(); i++){
      Platform currentPlatform = allPlatforms.get(i);
      currentPlatform.display();
    }
  }
  
  void update(){
    player.update(gravity);
  }
}
