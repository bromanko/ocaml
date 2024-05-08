open Core
open Dream_html
open HTML

type color =
  | Primary
  | PrimaryContent
  | Secondary
  | SecondaryContent
  | Accent
  | AccentContent
  | Neutral
  | NeutralContent
  | Base100
  | Base200
  | Base300
  | BaseContent
  | Info
  | InfoContent
  | Success
  | SuccessContent
  | Warning
  | WarningContent
  | Error
  | ErrorContent

let button inner = button [ class_ "btn" ] inner

let dropdown ~title (items : node list list) =
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

type badge_size = XSmall | Small | Medium | Large

let badge_size_to_class = function
  | XSmall -> "badge-xsm"
  | Small -> "badge-sm"
  | Medium -> "badge-md"
  | Large -> "badge-lg"

type badge_color =
  | Default
  | Neutral
  | Primary
  | Secondary
  | Accent
  | Ghost
  | Info
  | Success
  | Warning
  | Error

let badge_color_to_class = function
  | Default -> ""
  | Neutral -> "badge-neutral"
  | Primary -> "badge-primary"
  | Secondary -> "badge-secondary"
  | Accent -> "badge-accent"
  | Ghost -> "badge-ghost"
  | Info -> "badge-info"
  | Success -> "badge-success"
  | Warning -> "badge-warning"
  | Error -> "badge-error"

let badge ?(sz = Medium) ?(clr = Default) inner =
  span
    [ class_ "badge %s %s" (badge_size_to_class sz) (badge_color_to_class clr) ]
    inner

type link_color =
  | Neutral
  | Primary
  | Secondary
  | Accent
  | Success
  | Info
  | Warning
  | Error

let link_color_to_class = function
  | Neutral -> "link-neutral"
  | Primary -> "link-primary"
  | Secondary -> "link-secondary"
  | Accent -> "link-accent"
  | Success -> "link-success"
  | Info -> "link-info"
  | Warning -> "link-warning"
  | Error -> "link-error"

type link_modifier = HoverUnderline

let link_modifier_to_class m =
  match m with
  | Some m -> ( match m with HoverUnderline -> "link-hover")
  | None -> ""

let link ?(clr = Neutral) ?(md = None) inner =
  a
    [
      class_ "link %s %s" (link_color_to_class clr) (link_modifier_to_class md);
    ]
    inner
