let http_or_404 opt f =
  Option.fold ~none:(Dream.html ~code:404 "Not Found!") ~some:f opt

(* short-circuiting 404 error operator *)
let ( let</>? ) opt = http_or_404 opt
let home _req = Dream_html.respond (Templates.home ())
