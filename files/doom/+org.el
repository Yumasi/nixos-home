;;; ~/.doom.d/+latex.el -*- lexical-binding: t; -*-

(after! ox-latex
  (add-to-list 'org-latex-classes
               '("myreport"
                 "\\documentclass[11pt]{report}"
                 ;; ("\\part{%s}" . "\\chapter*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("myabstract"
                 "\\documentclass[11pt]{report}"
                 ;; ("\\part{%s}" . "\\chapter*{%s}")
                 ;; ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

(setq org-agenda-files '("~/org")
      org-directory "~/org/"
      org-log-done 'time
      deft-recursive t
      org-latex-pdf-process '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

(after! org
  (map! :map evil-org-mode-map
        :localleader
        :desc "Toggle checkbox" "m" #'org-toggle-checkbox))
