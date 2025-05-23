{...}: {
  luaLoader = {
    enable = true;
  };

  opts = {
    shiftwidth = 2;
    tabstop = 2;
    softtabstop = 0;
    scrolloff = 8;
    smartcase = true;
    ignorecase = true;
    number = true;
    signcolumn = "yes";
    wrap = false;
    undofile = true;
    expandtab = true;
    autoindent = true;
    updatetime = 100;
    hlsearch = true;
    virtualedit = "block";
    termguicolors = true;
    syntax = "on";
    laststatus = 3;
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions";
    mouse = "a";
    mousemodel = "extend";
    swapfile = false;
    modeline = true;
    incsearch = true;
    cursorline = true;
    cursorcolumn = false;
    fileencoding = "utf-8";
    breakindent = true;
    linebreak = true;
    infercase = true;
    preserveindent = true;
    copyindent = true;
    title = true;
    startofline = true;
    showmatch = true;
  };
}
