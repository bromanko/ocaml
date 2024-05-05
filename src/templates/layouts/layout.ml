let base inner =
  let open Dream_html in
  let open HTML in
  html [] [ body [] [ inner ] ]

let render = base
