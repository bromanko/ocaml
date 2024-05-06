let href path = Dream_html.uri_attr "href" "%s" (Static_files.Asset.url path)

let base inner =
  let open Dream_html in
  let open HTML in
  html
    [ lang "en" ]
    [
      head []
        [
          meta [ charset "utf-8" ];
          meta
            [ name "viewport"; content "width=device-width, initial-scale=1.0" ];
          link [ rel "stylesheet"; href "css/main.css" ];
        ];
      body [ class_ "bg-red-500 p-8" ] [ inner ];
    ]

let render = base
