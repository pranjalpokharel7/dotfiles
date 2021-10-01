;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Pranjal Pokharel"
      user-mail-address "pranjalpokharel007@gmail.com")

;; theme configuration
;;(setq doom-theme 'doom-one-light)
(setq doom-theme 'doom-one)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; relative line numbers
(setq display-line-numbers-type 'relative)

;; org-mode configuration
(setq org-directory "~/Documents/org-work")
(require 'org)

;; for syntax higlighting using minted (pypigment) package
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; to insert table of contents in it's own single page
(setq org-latex-toc-command "\\tableofcontents \\clearpage")
