% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "1.0",
%     date            = "24 January 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "send email to suchow@post.harvard.edu",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/01/24 v1.0 Dissertate Class]
\LoadClass[10pt, twoside]{book}

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\advisor#1{\gdef\@advisor{#1}}
\def\rector#1{\gdef\@rector{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\titledutch#1{\gdef\@titledutch{#1}}
\def\subtitledutch#1{\gdef\@subtitledutch{#1}}
\def\placeofbirth#1{\gdef\@placeofbirth{#1}}
\def\geboorteplaats#1{\gdef\@geboorteplaas{#1}}
\def\defensedate#1{\gdef\@defensedate{#1}}
\def\defensedatedutch#1{\gdef\@defensedatedutch{#1}}
\def\defensetime#1{\gdef\@defensetime{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}

\RequirePackage[cmyk,dvipsnames]{xcolor}
\usepackage{hyperref}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}
\RequirePackage[palatino]{quotchap}

\RequirePackage{kvoptions}
\DeclareStringOption{School}[]
\ProcessKeyvalOptions*
\RequirePackage{packages/\Dissertate@School/style}

\RequirePackage{graphicx}
\usepackage[acronym]{glossaries}
\RequirePackage{amssymb}
\RequirePackage{lettrine}
\RequirePackage[sectionbib]{chapterbib}
\RequirePackage[numbers]{natbib}
%\renewcommand{\bibnumfmt}[1]{[#1]}
%\RequirePackage[width=6.75in, letterpaper, bottom=3cm, top=3cm]{geometry}
\RequirePackage{fancyhdr}

\usepackage[titletoc]{appendix}
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}



\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{1}

\RequirePackage{url}
\usepackage[titles]{tocloft}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand{\cftsecfont}{\scshape}
\renewcommand{\cftsubsecfont}{\color{midgrey}}

% \usepackage{fixltx2e}
\usepackage{ragged2e}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Listing of figures}
% \RaggedRight

\parindent 12pt
\RequirePackage{mathspec}


\widowpenalty=300
\clubpenalty=300

\defaultfontfeatures{Mapping=tex-text}

%% use Garamond font
%%\fontspec [Path = ./fonts/Garamond,
%%    UprightFont = EBGaramond12-Regular.tff,
%%    ItalicFont = EBGaramond12-Italic.tff,
%%	BoldFont = AdobeGaramondProBold.ttf
%% ]
%%{EB Garamond}

%\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0, BoldFont = {Adobe Garamond Pro Bold}]{EB Garamond}
\setromanfont[Path=./fonts/Garamond/, Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0, BoldFont=EBGaramond-Bold.ttf, ItalicFont=EBGaramond-Italic.ttf]{EBGaramond-Regular.ttf}
% \newfontfamily{\smallcaps}[Path=./fonts/Garamond/, RawFeature={+c2sc,+scmp}]{EBGaramond12-Regular.ttf}
\setmathsfont(Digits,Latin,Greek)[Path=./fonts/Garamond/, Numbers={Proportional},SizeFeatures={{Size=-8, OpticalSize=8},{Size= 8-, OpticalSize=12}},]{EBGaramond12-Regular.ttf}
\setmathrm[Path=./fonts/Garamond/,]{EBGaramond12-Regular.ttf}

\newfontfamily{\fontVE}{Evergarden}[Path=./fonts/Aesthetic/,UprightFont=*]
\newfontfamily{\fontLWA}{lwafontcustom}[Path=./fonts/Aesthetic/,UprightFont=*]
\newfontfamily{\fontRedacted}{Redacted-Regular}[Path=./fonts/Aesthetic/,UprightFont=*]
% \newfontfamily{\fontCistercian}{FRBCistercian}[Path=./fonts/Aesthetic/,UprightFont=*]
\newfontfamily{\fontQiji}{qiji}[Path=./fonts/Aesthetic/,UprightFont=*]
\newfontfamily{\fontNotoCjk}{NotoSerifCJK-Regular}[Path=./fonts/,UprightFont=*]
\newfontfamily{\fontEBGaramondInitials}{EBGaramond-Initials}[Path=./fonts/Aesthetic/,UprightFont=*]
% \newfontfamily\fontNotoColorEmoji[Renderer=Harfbuzz]{NotoColorEmoji.ttf}

\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Iosevka Slab} % Font substitution for Source Code Pro

\RequirePackage[labelfont={bf,footnotesize,singlespacing},
	textfont={footnotesize,singlespacing},
	singlelinecheck=false,
	margin=0pt,
	figurewithin=chapter,
	tablewithin=chapter]{caption}

% \renewcommand{\thefootnote}{\fnsymbol{footnote}}

\onehalfspacing
%\doublespacing

% an environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}


% Align reference numbers so that they do not cause an indent
\newlength\mybibindent
\setlength\mybibindent{0pt}
\makeatletter
\renewenvironment{thebibliography}[1]
    {\section*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}
\makeatother
