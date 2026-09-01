# Aplica a paleta do Pywal no terminal
cat ~/.cache/wal/sequences 2>/dev/null

# Inicializa o prompt do Starship
starship init fish | source

# Executa o Fastfetch ao abrir o terminal
fastfetch
alias syu="sudo pacman -Syu"
alias c="cd"
