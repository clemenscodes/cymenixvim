{lib, ...}: {
  globals = {
    mapleader = " ";
    maplocalleader = lib.mkDefault " ";
    loaded_node_provider = 0;
    loaded_python3_provider = 0;
    loaded_perl_provider = 0;
    loaded_ruby_provider = 0;
  };
}
