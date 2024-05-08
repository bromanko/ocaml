let render () =
  let open Dream_html in
  let open HTML in
  let open Components in
  div []
    [
      div []
        [
          button [ txt "The Button" ];
          button ~clr:Neutral [ txt "Neutral" ];
          button ~clr:Info ~mods:(Some [ Wide; Outline ]) [ txt "Neutral" ];
          button ~sz:Small ~shp:(Some Square) ~clr:Warning [ txt "X" ];
          dropdown ~title:"Drop Down"
            [ [ a [] [ txt "Item 1" ] ]; [ a [] [ txt "Item 2" ] ] ];
          badge ~sz:Large ~clr:Info [ txt "Special User" ];
          link [ txt "This is a link" ];
        ];
      div [] [ navbar [ button [ txt "daisyUI" ] ] ];
    ]
  |> Layout.render
