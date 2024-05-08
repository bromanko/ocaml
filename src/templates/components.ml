open Core
open Dream_html
open HTML

type button_color =
  | Default
  | Neutral
  | Primary
  | Secondary
  | Accent
  | Info
  | Success
  | Warning
  | Error
  | Ghost

let button_color_to_class = function
  | Default -> ""
  | Neutral -> "btn-neutral"
  | Primary -> "btn-primary"
  | Secondary -> "btn-secondary"
  | Accent -> "btn-accent"
  | Info -> "btn-info"
  | Success -> "btn-success"
  | Warning -> "btn-warning"
  | Error -> "btn-error"
  | Ghost -> "btn-ghost"

type button_modifier = Link | Outline | Active | Disabled | Glass | Wide

let button_modifiers_to_class = function
  | None -> ""
  | Some mods ->
      List.fold mods ~init:"" ~f:(fun acc mod_ ->
          match mod_ with
          | Link -> acc ^ "btn-link "
          | Outline -> acc ^ "btn-outline "
          | Active -> acc ^ "btn-active "
          | Disabled -> acc ^ "btn-disabled "
          | Glass -> acc ^ "glass "
          | Wide -> acc ^ "btn-wide ")

type button_size = XSmall | Small | Medium | Large

let button_size_to_class = function
  | XSmall -> "btn-xs"
  | Small -> "btn-sm"
  | Medium -> "btn-md"
  | Large -> "btn-lg"

type button_shape = Block | Circle | Square

let button_shape_to_class = function
  | None -> ""
  | Some shape -> (
      match shape with
      | Block -> "btn-block"
      | Circle -> "btn-circle"
      | Square -> "btn-square")

let button ?(clr = Default) ?(mods = None) ?(sz = Medium) ?(shp = None) inner =
  button
    [
      class_ "btn %s %s %s %s"
        (button_color_to_class clr)
        (button_modifiers_to_class mods)
        (button_size_to_class sz)
        (button_shape_to_class shp);
    ]
    inner

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

let navbar inner = div [ class_ "navbar bg-base-100" ] inner
