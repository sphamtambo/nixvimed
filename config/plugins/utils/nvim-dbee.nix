{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "nvim-dbee";
      src = pkgs.fetchFromGitHub {
        owner = "kndndrj";
        repo = "nvim-dbee";
        rev = "85622c8d95b53f62329627fd461c52fca7cb612b";
        hash = "sha256-gjWQuktXkZRAS4Rj/H19G8hnHsViiJ4sI52uaCnSC9o=";
      };
    })
  ];

  # TODO: add this config
  extraConfigLua = ''
    require('dbee').setup({
      -- connections = {
      --   {
      --     name= 'mariadb',
      --     type = 'mysql',
      --     url = 'root@localhost:3306/test_db',
      --   },
      -- },
    })
  '';
}
