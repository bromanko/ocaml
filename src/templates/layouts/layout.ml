let base inner =
  let open Dream_html in
  let open HTML in
  html
    [ lang "en" ]
    [
      head []
        [
          link
            [
              rel "sylesheet"; href "%s" (Static_files.Asset.url "css/main.css");
            ];
        ];
      body [] [ inner ];
    ]

let render = base
