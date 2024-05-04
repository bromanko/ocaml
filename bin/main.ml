open! Core
open Cmdliner

let revolt () = Stdio.print_endline "Revolt!"
let revolt_t = Term.(const revolt $ const ())
let cmd = Cmd.v (Cmd.info "server") revolt_t

(* let hello who =
   let open Dream_html in
   let open HTML in
   html [] [ body [] [ h1 [] [ txt "Hello, %s!" who ] ] ] *)

let () = exit (Cmd.eval cmd)
(* Dream.run @@ Dream.logger @@ Dream.livereload
   @@ Dream.router
        [
          Dream.get "/" (fun _ -> Dream_html.respond (hello "world of the foo!"));
        ] *)
