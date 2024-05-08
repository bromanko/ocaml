let render () =
  let open Dream_html in
  let open HTML in
  let open Components in
  div []
    [
      button [ txt "The Button" ];
      dropdown ~title:"Drop Down"
        [ [ a [] [ txt "Item 1" ] ]; [ a [] [ txt "Item 2" ] ] ];
      badge ~sz:Large ~clr:Info [ txt "Special User" ];
    ]
  |> Layout.render
