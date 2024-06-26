open Dream_html

val h1 : node list -> node
val h2 : node list -> node
val h3 : node list -> node
val h4 : node list -> node

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

type button_modifier = Link | Outline | Active | Disabled | Glass | Wide
type button_size = XSmall | Small | Medium | Large
type button_shape = Block | Circle | Square

val button :
  ?clr:button_color ->
  ?mods:button_modifier list option ->
  ?sz:button_size ->
  ?shp:button_shape option ->
  node list ->
  node

val dropdown : title:string -> node list list -> node

type badge_size = XSmall | Small | Medium | Large

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

val badge : ?sz:badge_size -> ?clr:badge_color -> node list -> node

type link_color =
  | Neutral
  | Primary
  | Secondary
  | Accent
  | Success
  | Info
  | Warning
  | Error

type link_modifier = HoverUnderline

val link : ?clr:link_color -> ?md:link_modifier option -> node list -> node
val navbar : node list -> node
val pagination : node list -> node
val pagination_button : node list -> node

type checkbox_color =
  | Default
  | Primary
  | Secondary
  | Accent
  | Success
  | Warning
  | Info
  | Error

type checkbox_size = XSmall | Small | Medium | Large
type checkbox_modifier = Disabled

val checkbox :
  ?sz:checkbox_size ->
  ?clr:checkbox_color ->
  ?mods:checkbox_modifier list option ->
  bool ->
  node

val checkbox_with_label :
  ?sz:checkbox_size ->
  ?clr:checkbox_color ->
  ?mods:checkbox_modifier list option ->
  ?check:bool ->
  string ->
  node
