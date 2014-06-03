(* An eliom file *)
{shared{
  open Eliom_lib
  open Eliom_content
  open Html5.D
}}

module Yourprogram_app =
  Eliom_registration.App (
    struct
      let application_name = "monproj"
    end)

let main_service =
  Eliom_service.App.service ~path:[] ~get_params:Eliom_parameter.unit ()

{client{
     let say_hello _ =
       Eliom_lib.alert "Hello !";
}}
			    
let () =
  Yourprogram_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"coucou"
           ~css:[["css";"coucou.css"]]
	   ~js:[["monproj.js"]]
           Html5.F.(body [
             h2 [pcdata "Welcome from Eliom's distillery!"];
	     Raw.a ~a:[a_onclick {{say_hello}}] [pcdata "Hello !"];
           ])))
