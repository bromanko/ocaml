open! Core

let start_server port =
  Dream.run ~port @@ Dream.logger @@ Dream.livereload
  @@ Dream.router
       [ Dream.get "/" (fun _ -> Dream_html.respond (Templates.home ())) ]

let rec fact n = if n = 1 then 1 else n * fact (n - 1)
let%test _ = fact 5 = 120

let%expect_test _ =
  print_endline "Hello, world!";
  [%expect {| Hello, world! |}]
