return {
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import (builtins.getFlake(toString ./.)).inputs.nixpkgs { }",
            },
            formatting = {
                command = { "alejandra" },
            },
        }
    }
}
