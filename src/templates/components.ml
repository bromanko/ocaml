open Core
open Dream_html
open HTML

let h1 = h1 [ class_ "text-2xl" ]
let h2 = h2 [ class_ "text-xl" ]
let h3 = h3 [ class_ "text-lg" ]
let h4 = h4 [ class_ "text-md" ]

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

let button_modifiers_is_disabled = function
  | None -> false
  | Some mods -> List.exists ~f:(fun mod_ -> Poly.(mod_ = Disabled)) mods

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
      (if button_modifiers_is_disabled mods then disabled else null_);
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
let pagination inner = div [ class_ "join" ] inner
let pagination_button = HTML.button [ class_ "join-item btn btn-outline" ]

type checkbox_color =
  | Default
  | Primary
  | Secondary
  | Accent
  | Success
  | Warning
  | Info
  | Error

let checkbox_color_to_class = function
  | Default -> ""
  | Primary -> "checkbox-primary"
  | Secondary -> "checkbox-secondary"
  | Accent -> "checkbox-accent"
  | Success -> "checkbox-success"
  | Warning -> "checkbox-warning"
  | Info -> "checkbox-info"
  | Error -> "checkbox-error"

type checkbox_size = XSmall | Small | Medium | Large

let checkbox_size_to_class = function
  | XSmall -> "checkbox-xs"
  | Small -> "checkbox-sm"
  | Medium -> "checkbox-md"
  | Large -> "checkbox-lg"

type checkbox_modifier = Disabled

let checkbox_modifier_to_class = function
  | None -> ""
  | Some mods -> (
      match List.exists ~f:(fun mod_ -> Poly.(mod_ = Disabled)) mods with
      | true -> "disabled"
      | false -> "")

let checkbox_modifiers_is_disabled = function
  | None -> false
  | Some mods -> List.exists ~f:(fun mod_ -> Poly.(mod_ = Disabled)) mods

let checkbox ?(sz = Medium) ?(clr = Default) ?(mods = None) check =
  input
    [
      type_ "checkbox";
      class_ "checkbox %s %s %s"
        (checkbox_size_to_class sz)
        (checkbox_color_to_class clr)
        (checkbox_modifier_to_class mods);
      (if Bool.equal check true then HTML.checked else null_);
      (if checkbox_modifiers_is_disabled mods then disabled else null_);
    ]

let checkbox_with_label ?(sz = Medium) ?(clr = Default) ?(mods = None)
    ?(check = false) lbl =
  div
    [ class_ "form-control" ]
    [
      label
        [ class_ "label cursor-pointer" ]
        [
          span [ class_ "label-text" ] [ txt "%s" lbl ];
          checkbox ~sz ~clr ~mods check;
        ];
    ]
