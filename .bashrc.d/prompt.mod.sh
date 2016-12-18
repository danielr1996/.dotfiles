 function bash_prompt(){
      PS1="$(color red)\u$(color)"
      PS1=$PS1"@"
      PS1=$PS1"$(color green)\h$(color)"
      PS1=$PS1":"
      PS1=$PS1"$(color cyan)\W "
      PS1=$PS1"$(git_prompt)"
      PS1=$PS1"\n$(color purple)> $(color)"
 }
