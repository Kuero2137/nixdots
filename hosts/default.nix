{ self, ... } @ inputs:

{
  JD-PC = self.lib.mkSystem {
    hostname = "JD-PC";
    system = "x86_64-linux";
    home-manager = true;
    # extraHomeModules = [  ];
  };
}
