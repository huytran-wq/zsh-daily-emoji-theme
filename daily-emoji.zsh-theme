PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
get_emoji_from_day() {
 day_of_week=$(date +%u)
 case $day_of_week in
  1)
   get_random_emoji 🚗🚕🚌🏎🚓🚑🚒🚚🚜🛴🚲🛵🏍🚨🚖🚡🚠🚟🚃🚞🚄🚂🚉✈️🛫🛬🛩💺🛰🚀🛸🚁🛶⛵️🚤🛥🛳⛴⚓️⛽️🚧🚦🚏🗺🗿🗽🗼🏰🏯🏟🎡🎢🎠⛲️⛱🏖🏝🏜🌋⛰🏔🗻🏕⛺️🏠🏡🏭🏢🏣🏤🏥🏦🏨🏪🏫🏛⛪️🕌🕍⛩🛤🛣🗾🎑🏞🌅🌄🌠🎇🎆🌇🌆🏙🌃🌌🌉🌁
   ;;
  2)
   get_random_emoji 🍏🍎🍐🍊🍋🍌🍉🍇🍓🍒🍈🍑🥭🍍🥥🥝🍅🍆🥑🥦🥬🥒🌶🌽🥕🥔🍠🥐🥯🍞🥨🧀🥚🍳🥞🥓🥩🍗🍖🦴🌭🍔🍕🍟🥪🥙🌮🌯🥗🥘🥫🍝🍜🍲🍛🍣🍱🥟🍤🍙🍚🍘🍥🥠🥮🍢🍡🍧🍨🍦🥧🧁🍰🎂🍮🍭🍬🍫🍿🍩🍪🌰🥜🥃🍷🥂🍻🍺🍶🥤🍵☕️🍼🥛🍯🍸
   ;;
  3)
   get_random_emoji 🌵🎄🌲🌳🌴🌱🌿☘️🍀🎍🎋🍃🍂🍁🍄🌾💐🌷🌹🥀🌺🌸🌼🌻🌞🌝🌙🌎🌍🌏🌟✨⚡️☄️💥🔥🌪🌈☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨❄️☃️⛄️💨💧💦🌊🌫
   ;;
  4)
   get_random_emoji ️🐶🐱🐭🐹🐰🦊🦝🐻🐼🦘🦡🐨🐯🦁🐮🐷🐽🐸🐵🙈🙉🙊🐒🐔🐧🐦🐤🐣🐥🦆🦢🦅🦉🦚🦜🦇🐺🐗🐴🦄🐝🐛🦋🐌🐚🐞🐜🦗🕷🕸🦂🦟🦠🐢🐍🦎🦖🦕🐙🦑🦐🦀🐡🐠🐟🐬🐳🐋🦈🐊🐅🐆🦓🦍🐘🦏🦛🐪🐫🦙🦒🐃🐂🐄🐎🐖🐏🐑🐐🦌🐕🐩🐈🐓🦃🕊🐇🐁🐀🐿🦔🐾🐉🐲
   ;;
  5)
   get_random_emoji 😀😁😂🤣😃😄😅😆😉😊😋😎😍😘🥰😗😙😚🙂🤗🤩🤔🤨😐😑😶🙄😏😣😥😮🤐😯😪😫😴😌😛😜😝🤤😒😓😔😕🙃🤑😲🙁😖😞😟😤😢😭😦😧😨😩🤯😬😰😱😳🤪😵🤒🤕🤧😇🤠🥳🥺🤥🤫🤭🧐🤓
   ;;
  6)
   get_random_emoji ⚽️🏀🏈⚾️🥎🎾🏐🏉🥏🎱🏓🏸🏒🏑🥍🏏🥅⛳️🏹🎣🥋🎽🛹🤸‍🤼‍🛷⛸🥌🎿⛷🏂🎟🎗🎫🏵🏆🥇🥈🥉🏅🎪🎸🎺🎷🥁🎹🎼🎧🎤🎬🎨🎭🎻🎲♟🎯🎳🎮🧩
   ;;
  7)
   get_random_emoji 👐🙌👏🤝👍👎👊✊🤛🤜🤞️🤟🤘👌👈👉👆👇️✋🤚🖐🖖👋🤙
   ;;
  *)
   echo 🌵
   ;;
 esac
}

get_random_emoji() {
 local emojis=$1
 a=${#emojis}
 a=$(( $a ))
 rand_num=$RANDOM
 rand_index=$(( $rand_num % $a ))
 selected_emoji=${emojis:$rand_index:1}
 echo $selected_emoji
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
precmd() {
  # I have no idea why this is necessary, but it somehow makes sure the the emoji is always refreshed
  get_emoji_from_day > /dev/null
}


PROMPT='%{$fg[cyan]%}%~%{$fg_bold[red]%}$(parse_git_branch)%{$fg_bold[green]%} $(get_emoji_from_day) ➜%{$reset_color%} '
