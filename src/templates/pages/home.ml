let render () =
  let open Dream_html in
  let open HTML in
  let open Components in
  div []
    [
      h1 [ txt "Typography" ];
      div
        [ class_ "mb-8" ]
        [
          h1 [ txt "Heading 1" ];
          h2 [ txt "Heading 2" ];
          h3 [ txt "Heading 3" ];
          h4 [ txt "Heading 4" ];
        ];
      h1 [ txt "Buttons" ];
      div []
        [
          button [ txt "The Button" ];
          button ~clr:Neutral [ txt "Neutral" ];
          button ~clr:Info ~mods:(Some [ Wide; Outline ]) [ txt "Neutral" ];
          button ~sz:Small ~shp:(Some Square) ~clr:Warning [ txt "X" ];
          button ~mods:(Some [ Disabled ]) [ txt "Disabled" ];
          dropdown ~title:"Drop Down"
            [ [ a [] [ txt "Item 1" ] ]; [ a [] [ txt "Item 2" ] ] ];
          badge ~sz:Large ~clr:Info [ txt "Special User" ];
          link [ txt "This is a link" ];
          pagination
            [
              pagination_button [ txt "«" ];
              pagination_button [ txt "Page 22" ];
              pagination_button [ txt "»" ];
            ];
        ];
      h1 [ txt "Navigation" ];
      div [] [ navbar [ button [ txt "daisyUI" ] ] ];
    ]
  |> Layout.render
