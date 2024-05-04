open! Core
open Cmdliner

let hello who =
  let open Dream_html in
  let open HTML in
  html [] [ body [] [ h1 [] [ txt "Hello, %s!" who ] ] ]

let start_server () =
  Dream.run @@ Dream.logger @@ Dream.livereload
  @@ Dream.router
       [
         Dream.get "/" (fun _ -> Dream_html.respond (hello "world of the foo!"));
       ]

let start_server_t = Term.(const start_server $ const ())
let cmd = Cmd.v (Cmd.info "server") start_server_t
let () = exit (Cmd.eval cmd)
