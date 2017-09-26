def grasp -params 1 -hidden %{
  prompt "grasp %arg{1}" %{
    %sh{
      {
        coords=$(grasp -$1 -b --no-bold --no-color --no-multiline-separator "$kak_text" "$kak_buffile" \
          | awk 'match($0, /^([0-9]+),([0-9]+)-([0-9]+),([0-9]+)/, m) { print m[1]"."m[2]+1","m[3]"."m[4]+1 }' | paste -sd ':' -)
        if [ -n "$coords" ]; then
          cmd="select $coords"
        else
          cmd='echo -markup "{Error}no result from grasp"'
        fi
        printf '%s\n' "eval -client $kak_client %< $cmd >" | kak -p "$kak_session"
      } < /dev/null > /dev/null 2>&1 &
    }
  }
}

def grasp-e 'grasp e' -docstring 'select using grasp equery'
def grasp-s 'grasp s' -docstring 'select using grasp squery'
