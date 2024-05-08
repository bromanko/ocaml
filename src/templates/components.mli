open Dream_html

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

val button : node list -> node
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
