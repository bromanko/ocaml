open! Core

let hello who =
  let open Dream_html in
  let open HTML in
  html [] [ body [] [ h1 [] [ txt "Hello, %s!" who ] ] ]

let start_server port =
  Dream.run ~port @@ Dream.logger @@ Dream.livereload
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream_html.respond (hello "world of the foo!"));
       ]

let rec fact n = if n = 1 then 1 else n * fact (n - 1)
let%test _ = fact 5 = 120

let%expect_test _ =
  print_endline "Hello, world!";
  [%expect {| Hello, world! |}]
