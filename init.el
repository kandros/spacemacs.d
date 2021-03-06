(defun dotspacemacs/layers ()
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     ;; yaml
     ;; rust
     markdown
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; my layers
     ;; themes-megapack
     (go :variables
         go-tab-width 4
         gofmt-command "goimports")
     shell
     ;; (spell-checking :variables
     ;;                 spell-checking-enable-by-default nil
     ;;                 enable-flyspell-auto-completion t
     ;;                 )
     ;; flow
     helm
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'complete
                      )
     better-defaults
     emacs-lisp
     ;; docker
     git
     (osx :variables
          osx-command-as 'super)
     (syntax-checking :variables
                      syntax-checking-enable-tooltips t)
     ;; aaronjenses's layers
     aj-javascript
     aj-elixir

     ;; TheBB layers
     evil-little-word
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     all-the-icons
     company-flx
     easy-hugo
     emojify
     evil-multiedit
     exec-path-from-shell
     tide
     mocha
     doom-themes
     ;; npm-mode
     ;; writeroom-mode
     eros
     indium
     ;; oceanic-theme
     flycheck-popup-tip
     company-quickhelp
     ;; (evil-briefcase :location (recipe :fetcher github :repo "strickinato/evil-briefcase"))
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    tern
                                    company-tern
                                    eyebrowse
                                    vi-tilde-fringe
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only)

;; Conditionally load a layer example
  ;; (when (spacemacs/system-is-mac)
    ;; (add-to-list 'dotspacemacs-configuration-layers 'osx))

  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         doom-one
                         spacemacs-dark
                         twilight-bright
                         ;; solarized-light
                         ;; zenburn
                         ;; oceanic
                         ;; misterioso
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   ; default was "Source Code Pro"
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."


  ;; Fix powerline separator colors on mac
  (setq powerline-image-apple-rgb t)

  (add-to-list 'load-path (expand-file-name "lisp" dotspacemacs-directory))
  (add-to-list 'custom-theme-load-path "~/.spacemacs.d/themes/")

  ;; (require 'utils)
  (require 'functions)
  ;; (require 'react)
  ;; (require 'nextjs)

) ; END user-init


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-hud-off)


  (evil-global-set-key 'normal (kbd "C-e") 'mwim-end-of-code-or-line)
  (evil-global-set-key 'visual (kbd "C-e") 'mwim-end-of-code-or-line)
  (evil-global-set-key 'insert (kbd "C-d") nil) ; disable C-d so that rjsx close tad works as intended

  (define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
  (define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
  (define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
  (define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)

;;  (define-key neotree-mode-map (kbd "C-l") #'evil-window-right)

  (evil-global-set-key 'normal (kbd "s-k") 'move-text-line-up)
  (evil-global-set-key 'normal (kbd "s-j") 'move-text-line-down)
  (evil-global-set-key 'normal (kbd "s-d") 'evil-mc-make-and-goto-next-match)
  (evil-global-set-key 'visual (kbd "s-d") 'evil-mc-make-and-goto-next-match)
  (evil-global-set-key 'visual (kbd "v") 'er/expand-region)

  (evil-global-set-key 'normal (kbd "j") 'evil-next-visual-line)
  (evil-global-set-key 'normal (kbd "k") 'evil-previous-visual-line)

  ;; (evil-global-set-key 'normal (kbd "}") 'dwim-curly)

  (evil-global-set-key 'normal (kbd "C-i") 'evil-jump-forward)
  (advice-add 'evil-jump-forward :after 'recenter)
  (advice-add 'evil-jump-forward :after 'recenter)

  (evil-global-set-key 'normal (kbd "C-m") 'evilmi-jump-items)

  (evil-global-set-key 'insert (kbd "TAB") 'yas-expand)

  ;; Enable evil-mc for only prog and text, so it doesn't screw w/ magit and such
  (with-eval-after-load 'evil-mc
    (add-hook 'prog-mode-hook 'turn-on-evil-mc-mode)
    (add-hook 'text-mode-hook 'turn-on-evil-mc-mode))

  ;; move selection down
  (evil-global-set-key 'visual (kbd "s-j")
    (concat ":move '>+1" (kbd "RET") "gv=gv"))

  ;; move selection up
  (evil-global-set-key 'visual (kbd "s-k")
                       (concat ":move '<-2" (kbd "RET") "gv=gv"))

  ; enter insert mode when in magit's commit buffer
  (add-hook 'git-commit-mode-hook 'evil-insert-state)

  ;; set delay for autocomplete menu to show
  (setq company-idle-delay 0.1)

  ;; enable fuzzy in autocompletion
  (with-eval-after-load 'company
    (company-flx-mode +1)
    )

  (setq neo-theme 'icons)

  (setq flycheck-display-errors-delay 0.2)

  (use-package mocha
  :ensure t
  :commands (mocha-test-project
             mocha-debug-project
             mocha-test-file
             mocha-debug-file
             mocha-test-at-point
             mocha-debug-at-point)
  :config
  ;; Clear up stray ansi escape sequences.
  (defvar jj*--mocha-ansi-escape-sequences
    ;; https://emacs.stackexchange.com/questions/18457/stripping-stray-ansi-escape-sequences-from-eshell
    (rx (or
         "^[\\[[0-9]+[a-z]"
         "[1A"
         "[999D")))

  (defun jj*--mocha-compilation-filter ()
    "Filter function for compilation output."
    (ansi-color-apply-on-region compilation-filter-start (point-max))
    (save-excursion
      (goto-char compilation-filter-start)
      (while (re-search-forward jj*--mocha-ansi-escape-sequences nil t)
        (replace-match ""))))

  (advice-add 'mocha-compilation-filter :override 'jj*--mocha-compilation-filter)

  ;; https://github.com/scottaj/mocha.el/issues/3
  (defcustom mocha-jest-command "node_modules/.bin/jest --colors"
    "The path to the jest command to run."
    :type 'string
    :group 'mocha)

  (defun mocha-generate-command--jest-command (debug &optional filename testname)
    "Generate a command to run the test suite with jest.
If DEBUG is true, then make this a debug command.
If FILENAME is specified run just that file otherwise run
MOCHA-PROJECT-TEST-DIRECTORY.
IF TESTNAME is specified run jest with a pattern for just that test."
    (let ((target (if testname (concat " --testNamePattern \"" testname "\"") ""))
          (path (if (or filename mocha-project-test-directory)
                    (concat " --testPathPattern \""
                            (if filename filename mocha-project-test-directory)
                            "\"")
                  ""))
          (node-command
           (concat mocha-which-node
                   (if debug (concat " --debug=" mocha-debug-port) ""))))
      (concat node-command " "
              mocha-jest-command
              target
              path)))

  (advice-add 'mocha-generate-command
              :override 'mocha-generate-command--jest-command))

  ; blog
  (setq easy-hugo-basedir "~/coding/blog/")
  (setq easy-hugo-postdir "content/posts")

  ;; (setq easy-hugo-url "https://yourblogdomain")

  (setq confirm-kill-emacs 'y-or-n-p)

  (defun aj/magit-stage-all-and-commit ()
    (interactive)
    (magit-stage-modified t)
    (setq this-command 'magit-commit)
    (setq magit-commit-show-diff t)
    (magit-commit))
  (advice-add 'magit-commit-diff :after (lambda ()
                                          "Disable magit-commit-show-diff."
                                          (setq magit-commit-show-diff nil)))
  (spacemacs/set-leader-keys "gc" #'aj/magit-stage-all-and-commit)
  (spacemacs/set-leader-keys "jt" #'avy-goto-char-timer)

(use-package evil-mc
  :ensure t
  :defer t
  :diminish evil-mc-mode "ⓒ"
  :init (global-evil-mc-mode t)
  :init (add-hook 'after-init-hook #'global-evil-mc-mode)
  :bind (:map evil-mc-key-map
              ("C-g" . evil-mc-undo-all-cursors)
              )
  :config
  (progn
    (evil-define-key 'normal evil-mc-key-map (kbd "<escape>") 'evil-mc-undo-all-cursors)))

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'prog-mode-hook 'flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))

;; not working, will get back to this
;; (use-package npm-mode
;;   :defer t
;;   :commands (npm-mode npm-global-mode)
;;   :init
;;   (add-hook 'rjsx-mode-hook 'npm-mode)
;; )


(setq css-indent-offset 2)

;; (evil-define-minor-mode-key 'normal 'indium-debugger-mode
;;   (kbd "SPC") nil)
;; (evil-define-minor-mode-key 'normal 'indium-debugger-mode
;;   (kbd "c'") nil)
;; (evil-define-minor-mode-key 'normal 'indium-debugger-mode
;;   (kbd "l'") nil)
;; (evil-define-minor-mode-key 'normal 'indium-debugger-mode
;;   (kbd "e'") nil)

(setq hyper-key "C-M-S-s")

(global-set-key (kbd (concat hyper-key "-h")) 'help)

(global-set-key (kbd "s-/") 'comment-line)
(global-set-key (kbd "s-D") 'spacemacs/duplicate-line-or-region)
(global-set-key (kbd "s-f") 'spacemacs/helm-project-do-ag)
(global-set-key (kbd "s-p") 'helm-projectile-find-file)
(global-set-key (kbd "s-1") 'neotree-find-project-root)
(global-set-key (kbd "s-3") 'spacemacs/default-pop-shell)
(global-set-key (kbd "s-n") (lambda()
                              (interactive)
                              (make-frame)
                              (spacemacs/toggle-maximize-buffer)))
(global-set-key (kbd "s-N") 'make-frame)
(global-set-key (kbd "s-b") 'helm-mini)

;; (global-set-key (kbd "C-c C-j") 'avy-goto-char-timer)
(global-set-key (kbd "C-c C-t") 'emmet-wrap-with-markup)
(global-set-key (kbd "C-SPC") 'company-complete)
;; (global-set-key (kbd "}") 'dwim-curly)

(global-set-key (kbd "s-<up>") 'split-window-below)
(global-set-key (kbd "s-<right>") 'split-window-right-and-focus)
(global-set-key (kbd "s-<down>") 'split-window-below-and-focus)
(global-set-key (kbd "s-<left>") 'split-window-right)

(global-set-key (kbd "C-s-<268632072>") 'split-window-right) ; C-s-h
(global-set-key (kbd "C-s-<268632074>") 'split-window-below-and-focus) ; C-s-j
(global-set-key (kbd "C-s-<268632075>") 'split-window-below) ; C-s-k
(global-set-key (kbd "C-s-<268632076>") 'split-window-right-and-focus)  ;C-s-l


(global-set-key (kbd "C-c m") 'magit-status)
(global-set-key (kbd "C-c C-m") 'magit-status)
(global-set-key (kbd "C-c C-g C-c") 'magit-checkout)
(global-set-key (kbd "M-v") 'toggle-camelcase-underscores)
;; (global-set-key (kbd "s-b") 'spacemacs/jump-to-definition)
;; (global-set-key (kbd "s-o") 'spacemacs/jump-to-definition)
(global-set-key (kbd "<s-backspace>") 'kill-whole-line)
(global-set-key (kbd "s-y") 'helm-show-kill-ring)
(global-set-key (kbd "s-l") 'select-current-line)

(with-eval-after-load 'rjsx-mode
  (progn
    (setq emmet-expand-jsx-className? t)

    (define-key js2-mode-map (kbd "C-c C-t") nil)
    (define-key js2-mode-map (kbd "C-c C-o") nil)

    (define-key rjsx-mode-map (kbd "C-c C-l") 'console-log-at-point)
    (define-key rjsx-mode-map (kbd "C-c C-d") 'debugger-next-line)
    (define-key rjsx-mode-map (kbd "s-o") 'tide-jump-to-definition)
    (define-key rjsx-mode-map (kbd "s-O") (lambda()
                                            (interactive)
                                            (split-window-below-and-focus)
                                            (tide-jump-to-definition)))
    (define-key rjsx-mode-map (kbd "C-c C-r") 'tide-rename-symbol)
    (define-key rjsx-mode-map (kbd "C-c C-t") 'rjsx-rename-tag-at-point)
    (define-key rjsx-mode-map (kbd "C-c C-p") 'jsx-prop-at-point)

    (advice-add 'tide-jump-to-definition :after 'recenter)
    ;; (setq-local helm-dash-docsets '("Lo-Dash"))
  ))


(with-eval-after-load 'go-mode
  (progn
    (load "~/go/src/github.com/stapelberg/expanderr/expanderr.el")
    (define-key go-mode-map (kbd "C-c C-e") #'go-expanderr)
    (define-key go-mode-map (kbd "s-o") 'go-guru-definition)
    (define-key go-mode-map (kbd "s-O") (lambda()
                                          (interactive)
                                          (split-window-below-and-focus)
                                          (go-guru-definition)
                                          ))

    (define-key go-mode-map (kbd "C-c C-r") 'go-rename)
    (define-key go-mode-map (kbd "C-c go")  (lambda()
                                              (interactive)
                                              (split-window-below-and-focus)
                                              (find-file "/Users/jaga/go/src/github.com/kandros/go")
                                              ))

    (advice-add 'go-guru-definition :after 'recenter)
    ))

;; (setq neo-autorefresh t) ; enable autorefresh of neotree

(setq yas-snippet-dirs '("~/.spacemacs.d/snippets"))


;; I know... i know.. i gotta learn elisp
(evil-define-operator wrap-with-single-quote (beg end)
  (goto-char beg)
  (insert "'")
  (goto-char (1+ end))
  (insert "'"))

(evil-define-key 'visual global-map
  (kbd "'") 'wrap-with-single-quote)

(evil-define-operator wrap-with-double-quote (beg end)
  (goto-char beg)
  (insert "\"")
  (goto-char (1+ end))
  (insert "\""))

(evil-define-key 'visual global-map
  (kbd "\"") 'wrap-with-double-quote)

(evil-define-operator wrap-with-square-bracket (beg end)
  (goto-char beg)
  (insert "[")
  (goto-char (1+ end))
  (insert "]"))

(evil-define-key 'visual global-map
  (kbd "[") 'wrap-with-square-bracket)

(evil-define-operator wrap-with-parens (beg end)
  (goto-char beg)
  (insert "(")
  (goto-char (1+ end))
  (insert ")"))

(evil-define-key 'visual global-map
  (kbd "(") 'wrap-with-parens)

(evil-define-operator wrap-with-curly (beg end)
  (goto-char beg)
  (insert "{")
  (goto-char (1+ end))
  (insert "}"))

(evil-define-key 'visual global-map
  (kbd "{") 'wrap-with-curly)

(evil-define-operator wrap-with-backtick (beg end)
  (goto-char beg)
  (insert "`")
  (goto-char (1+ end))
  (insert "`"))

(evil-define-key 'visual global-map
  (kbd "`") 'wrap-with-backtick)

;; make paste when a region is selected like if should (replace text with system clipobard)
;; https://emacs.stackexchange.com/questions/14940/emacs-doesnt-paste-in-evils-visual-mode-with-every-os-clipboard/15054#15054
(fset 'evil-visual-update-x-selection 'ignore)
(delete-selection-mode 1)

(use-package eros
  :defer t
  :init
  (add-hook 'emacs-lisp-mode-hook #'eros-mode))


(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (setq company-tooltip-align-annotations t)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
  ;; (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
  (cl-pushnew 'company-tide company-backends)
  )

;; aligns annotation to the right hand side

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
(flycheck-add-mode 'typescript-tslint 'web-mode)

(evil-make-overriding-map indium-debugger-mode-map)
(evil-make-overriding-map indium-debugger-locals-mode-map)


(use-package evil-escape
  :commands evil-escape-mode
  :init
  (setq evil-escape-excluded-states '(normal visual multiedit emacs motion)
        evil-escape-excluded-major-modes '(neotree-mode)
        evil-escape-key-sequence "jk"
        evil-escape-delay 0.25)
  (add-hook 'after-init-hook #'evil-escape-mode)
  :config
  ;; no `evil-escape' in minibuffer
  (cl-pushnew #'minibufferp evil-escape-inhibit-functions :test #'eq)

  (define-key evil-insert-state-map  (kbd "C-g") #'evil-escape)
  (define-key evil-replace-state-map (kbd "C-g") #'evil-escape)
  (define-key evil-visual-state-map  (kbd "C-g") #'evil-escape)
  (define-key evil-operator-state-map (kbd "C-g") #'evil-escape))

(flycheck-pos-tip-mode -1)
(flycheck-popup-tip-mode 1)

(setq magit-diff-refine-hunk t)

;; (evil-briefcase-mode 1)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))


(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "it")

;; (global-set-key [remap evil-yank] 'linum-relative-evil-yank)
;; (global-set-key [remap evil-delete] 'linum-relative-evil-delete)

;; (eval-after-load 'company
;;   '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))
;; (company-quickhelp-delay nil)

(defun dear-leader/swap-keys (key1 key2)
     (let ((map1 (lookup-key spacemacs-default-map key1))
                    (map2 (lookup-key spacemacs-default-map key2)))
            (spacemacs/set-leader-keys key1 map2 key2 map1)))

(dear-leader/swap-keys "el" "eL")

(add-hook 'after-init-hook #'set-mellow-theme)

  ) ; END user-config



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (tern company-quickhelp graphql-mode indium ht f avy helm-dash websocket powerline flycheck-popup-tip projectile smartparens iedit evil goto-chg elixir-mode flycheck company helm helm-core yasnippet markdown-mode org-plus-contrib magit magit-popup git-commit with-editor async hydra haml-mode js2-mode simple-httpd dash s doom-themes color-theme-solarized treemacs-evil treemacs rainbow-identifiers rainbow-mode eros tide typescript-mode define-word zonokai-theme zenburn-theme zen-and-art-theme xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode rjsx-mode reverse-theme reveal-in-osx-finder restclient restart-emacs rainbow-delimiters railscasts-theme purple-haze-theme pug-mode professional-theme prettier-js popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit organic-green-theme org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-elixir npm-mode noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mocha mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode linum-relative link-hint light-soap-theme less-css-mode launchctl json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flycheck-pos-tip flycheck-mix flycheck-dogma flycheck-dialyxir flycheck-credo flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-multiedit evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eslintd-fix eshell-z eshell-prompt-extras esh-help erlang emojify emmet-mode elisp-slime-nav easy-hugo dumb-jump dracula-theme django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme csv-mode company-web company-tern company-statistics company-go company-flx column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme all-the-icons alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-mode ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (prettier-js-mode 0))
     (eval progn
           (prettier-js-mode 0)
           (eslintd-fix-mode 0))
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(company-flx-limit 100)
 '(company-idle-delay 0)
 '(evil-want-Y-yank-to-eol nil)
 '(magit-commit-arguments (quote ("--verbose")))
 '(package-selected-packages
   (quote
    (rainbow-mode symon string-inflection password-generator impatient-mode htmlize helm-purpose window-purpose imenu-list godoctor go-rename evil-lion editorconfig visual-fill-column unfill mwim markdown-toc gh-md emojify ht yaml-mode mmm-mode npm-mode markdown-mode flyspell-popup nodejs-repl writeroom-mode flyspell-correct-helm flyspell-correct auto-dictionary gruvbox-theme autothemer minimap reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl easy-hugo toml-mode racer flycheck-rust seq cargo rust-mode mocha go-guru go-eldoc company-go go-mode all-the-icons memoize font-lock+ dockerfile-mode docker tablist docker-tramp company-flx company-tern dash-functional tern helm-company helm-c-yasnippet fuzzy company-web web-completion-data company-statistics company-flow auto-yasnippet ac-ispell auto-complete flycheck-pos-tip pos-tip flycheck-flow ob-elixir flycheck-mix flycheck-dogma flycheck-dialyxir flycheck-credo flycheck erlang alchemist company elixir-mode spinner adaptive-wrap web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help web-beautify rjsx-mode prettier-js livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc eslintd-fix coffee-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval progn
           (prettier-js-mode 0)
           (set-mellow-theme))
     (eval progn
           (prettier-js-mode 0)
           (flycheck-disable-checker
            (quote jsx-tide)))
     (eval progn
           (prettier-js-mode 0))
     (eval progn
           (prettier-js-mode 0)
           (eslintd-fix-mode 0))
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(standard-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
