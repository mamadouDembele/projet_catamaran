
(cl:in-package :asdf)

(defsystem "commande-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Control" :depends-on ("_package_Control"))
    (:file "_package_Control" :depends-on ("_package"))
    (:file "Etat" :depends-on ("_package_Etat"))
    (:file "_package_Etat" :depends-on ("_package"))
  ))