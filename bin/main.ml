let hello who =
  let open Dream_html in
  let open HTML in
  html [] [ body [] [ h1 [] [ txt "Hello, %s!" who ] ] ]

let () =
  Dream.run @@ Dream.logger @@ Dream.livereload
  @@ Dream.router
       [ Dream.get "/" (fun _ -> Dream_html.respond (hello "world")) ]
