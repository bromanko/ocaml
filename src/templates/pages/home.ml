let render () =
  let open Dream_html in
  let open HTML in
  let open Components in
  div []
    [
      button [ txt "The Button" ];
      dropdown "Drop Down"
        [ [ a [] [ txt "Item 1" ] ]; [ a [] [ txt "Item 2" ] ] ];
    ]
  |> Layout.render
