open Core
open Dream_html
open HTML

let button inner = button [ class_ "btn" ] inner

let dropdown title (items : node list list) =
  div
    [ class_ "dropdown" ]
    [
      div [ tabindex 0; role "button"; class_ "m1 btn" ] [ txt "%s" title ];
      ul
        [
          tabindex 0;
          class_
            "dropdown-content menu z-[1] w-52 rounded-box bg-base-100 p-2 \
             shadow";
        ]
        (List.map items ~f:(fun item -> li [] item));
    ]
