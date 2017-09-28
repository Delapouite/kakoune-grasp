# first arg: s or e
#  query engine
# second arg: all or main
#  select all or only the one which intersects with current main selection
def grasp -params 2 -hidden %{
  prompt "grasp %arg{1}" %{
    %sh{
      {
        # clean grasp output
        coords=$(grasp -$1 -b --no-bold --no-color --no-multiline-separator "$kak_text" "$kak_buffile" \
          | awk 'match($0, /^([0-9]+),([0-9]+)-([0-9]+),([0-9]+)/, m) { print m[1]"."m[2]+1","m[3]"."m[4]+1 }' | paste -sd ':' -)

        if [ $2 = 'main' ]; then
          IFS=',' read -ra bounds  <<< "$kak_selection_desc"
          main_cursor="${bounds[0]}"
          main_anchor="${bounds[1]}"

          # keep only the selection that intersects with current main selection
          IFS=':' read -ra coords_array <<< "$coords"
          for coord in "${coords_array[@]}"; do
            IFS=',' read -ra bounds <<< "$coord"
            sel_anchor="${bounds[0]}"
            sel_cursor="${bounds[1]}"
            # bc returns 1 for success, 0 for failure
            intersect=$(bc -l <<< "$sel_anchor <= $main_anchor && $sel_cursor >= $main_cursor")
            if [ $intersect -eq 1 ]; then
              coords=$coord
            fi
          done
        fi

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

def grasp-e 'grasp e all' -docstring 'select all using grasp equery'
def grasp-s 'grasp s all' -docstring 'select all using grasp squery'
def grasp-e-main 'grasp e main' -docstring 'select only main using grasp equery'
def grasp-s-main 'grasp s main' -docstring 'select only main using grasp squery'
